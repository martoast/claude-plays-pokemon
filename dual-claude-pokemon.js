const WebSocket = require('ws');
const fs = require('fs');

// Simple logging utility
const logger = {
  log: (message) => {
    const timestamp = new Date().toISOString();
    console.log(`[${timestamp}] ${message}`);
    fs.appendFileSync('pokemon-log.txt', `[${timestamp}] ${message}\n`);
  },
  error: (message) => {
    const timestamp = new Date().toISOString();
    console.error(`[${timestamp}] ERROR: ${message}`);
    fs.appendFileSync('pokemon-log.txt', `[${timestamp}] ERROR: ${message}\n`);
  }
};

// Communication between Player and Supervisor
const MessageQueue = {
  playerToSupervisor: [],
  supervisorToPlayer: [],
  
  sendToSupervisor(message) {
    this.playerToSupervisor.push({
      ...message,
      timestamp: Date.now()
    });
  },
  
  sendToPlayer(message) {
    this.supervisorToPlayer.push({
      ...message,
      timestamp: Date.now()
    });
  },
  
  getPlayerMessages() {
    const messages = [...this.supervisorToPlayer];
    this.supervisorToPlayer = [];
    return messages;
  },
  
  getSupervisorMessages() {
    const messages = [...this.playerToSupervisor];
    this.playerToSupervisor = [];
    return messages;
  }
};

// Player Claude - Handles immediate actions
const Player = {
  state: {
    position: { x: 0, y: 0 },
    targetPosition: { x: 0, y: 0 },
    currentMap: "",
    path: [],
    isInBattle: false,
    lastAction: null,
    actionHistory: [],
    stuckCount: 0
  },
  
  processGameState(gameState) {
    // Update state with new information
    if (gameState.position) this.state.position = gameState.position;
    if (gameState.map) this.state.currentMap = gameState.map;
    if (gameState.isInBattle !== undefined) this.state.isInBattle = gameState.isInBattle;
    
    // Check messages from supervisor
    this.processSupervisorMessages();
    
    // Decide next action
    let action;
    if (this.state.isInBattle) {
      action = this.handleBattle();
    } else {
      action = this.handleOverworld();
    }
    
    // Record action for history
    this.recordAction(action);
    
    return action;
  },
  
  handleOverworld() {
    // Check if we have a path to follow
    if (this.state.path.length > 0) {
      const nextStep = this.state.path[0];
      const action = this.getDirectionToTile(this.state.position, nextStep);
      
      // If we've reached this step, remove it from the path
      if (this.state.position.x === nextStep.x && this.state.position.y === nextStep.y) {
        this.state.path.shift();
      }
      
      return action;
    } else if (this.state.targetPosition.x !== undefined) {
      // Request path to target
      return { type: 'REQUEST_PATH', target: this.state.targetPosition };
    } else {
      // No target, just press A occasionally
      return { type: 'PRESS_BUTTON', button: 'A' };
    }
  },
  
  handleBattle() {
    // Simple battle strategy - just press A most of the time
    // This relies on the existing paste.txt script's battle handling
    return { type: 'PRESS_BUTTON', button: 'A' };
  },
  
  getDirectionToTile(current, target) {
    // Determine direction to move based on current and target positions
    if (target.x > current.x) return { type: 'PRESS_BUTTON', button: 'RIGHT' };
    if (target.x < current.x) return { type: 'PRESS_BUTTON', button: 'LEFT' };
    if (target.y > current.y) return { type: 'PRESS_BUTTON', button: 'DOWN' };
    if (target.y < current.y) return { type: 'PRESS_BUTTON', button: 'UP' };
    return { type: 'PRESS_BUTTON', button: 'A' }; // If we're already there, interact
  },
  
  processSupervisorMessages() {
    const messages = MessageQueue.getPlayerMessages();
    
    messages.forEach(message => {
      switch(message.type) {
        case 'NEW_TARGET':
          logger.log(`Player received new target: ${JSON.stringify(message.target)}`);
          this.state.targetPosition = message.target;
          this.state.path = []; // Clear current path
          break;
        case 'UNSTUCK':
          logger.log(`Player received unstuck command`);
          this.state.path = [];
          this.state.stuckCount = 0;
          break;
      }
    });
  },
  
  recordAction(action) {
    this.state.actionHistory.push({
      action,
      position: { ...this.state.position },
      timestamp: Date.now()
    });
    
    // Keep history at a reasonable size
    if (this.state.actionHistory.length > 100) {
      this.state.actionHistory.shift();
    }
    
    // Report to supervisor
    MessageQueue.sendToSupervisor({
      type: 'ACTION_REPORT',
      action,
      position: this.state.position,
      map: this.state.currentMap,
      isInBattle: this.state.isInBattle
    });
    
    this.state.lastAction = action;
  }
};

// Supervisor Claude - Provides oversight and strategy
const Supervisor = {
  state: {
    playerHistory: [],
    knownMaps: new Set(),
    visitedPositions: new Set(),
    detectedLoops: 0,
    lastTargetChange: 0,
    goals: []
  },
  
  processPlayerReports() {
    const messages = MessageQueue.getSupervisorMessages();
    
    messages.forEach(message => {
      if (message.type === 'ACTION_REPORT') {
        // Add to history
        this.state.playerHistory.push(message);
        
        // Keep history manageable
        if (this.state.playerHistory.length > 200) {
          this.state.playerHistory.shift();
        }
        
        // Track visited positions
        if (message.position) {
          const posKey = `${message.position.x},${message.position.y}`;
          this.state.visitedPositions.add(posKey);
        }
        
        // Track known maps
        if (message.map) {
          this.state.knownMaps.add(message.map);
        }
      }
    });
    
    // Analyze for issues and provide guidance
    this.analyzePlayerBehavior();
  },
  
  analyzePlayerBehavior() {
    // Detect if player is stuck
    this.detectMovementLoops();
    
    // Check if it's time for a new goal
    this.updateGoals();
  },
  
  detectMovementLoops() {
    // Only examine recent history (last 30 actions)
    const recentHistory = this.state.playerHistory.slice(-30);
    
    // Count occurrences of each position
    const positionCounts = {};
    recentHistory.forEach(entry => {
      if (!entry.position) return;
      
      const posKey = `${entry.position.x},${entry.position.y}`;
      positionCounts[posKey] = (positionCounts[posKey] || 0) + 1;
    });
    
    // Check if any position appears too frequently (indicating being stuck)
    const stuckThreshold = 10;
    let isStuck = false;
    let stuckPosition;
    
    for (const [position, count] of Object.entries(positionCounts)) {
      if (count > stuckThreshold) {
        isStuck = true;
        stuckPosition = position;
        break;
      }
    }
    
    if (isStuck) {
      this.state.detectedLoops++;
      logger.log(`Detected movement loop at position ${stuckPosition} (loop #${this.state.detectedLoops})`);
      
      // Issue unstuck command and new target
      this.issueUnstuckCommand();
    }
  },
  
  updateGoals() {
    // Don't change targets too frequently
    const now = Date.now();
    const timeSinceLastChange = now - this.state.lastTargetChange;
    const minChangeInterval = 30000; // 30 seconds
    
    if (timeSinceLastChange < minChangeInterval) return;
    
    // Set a new target occasionally to encourage exploration
    if (Math.random() < 0.1) {
      this.issueNewTarget();
    }
  },
  
  issueUnstuckCommand() {
    MessageQueue.sendToPlayer({
      type: 'UNSTUCK',
      priority: 'HIGH',
    });
    
    // Also set a new target
    this.issueNewTarget();
  },
  
  issueNewTarget() {
    // Generate random target coordinates
    // The actual pathfinding will be handled by the paste.txt script
    const randomTarget = {
      x: Math.floor(Math.random() * 100),
      y: Math.floor(Math.random() * 100)
    };
    
    MessageQueue.sendToPlayer({
      type: 'NEW_TARGET',
      target: randomTarget,
      priority: 'MEDIUM'
    });
    
    this.state.lastTargetChange = Date.now();
    logger.log(`Set new target: ${JSON.stringify(randomTarget)}`);
  }
};

// Main controller
class PokemonController {
  constructor() {
    this.ws = null;
    this.gameState = {
      position: { x: 0, y: 0 },
      map: "",
      isInBattle: false
    };
    this.connected = false;
    this.reconnectAttempts = 0;
  }
  
  async start() {
    logger.log("Starting Pokemon Dual-Claude Controller");
    this.connectToEmulator();
    
    // Main loop
    setInterval(() => this.mainLoop(), 100);
  }
  
  connectToEmulator() {
    logger.log("Connecting to emulator...");
    
    try {
      this.ws = new WebSocket('ws://127.0.0.1:8888');
      
      this.ws.on('open', () => {
        logger.log("Connected to emulator!");
        this.connected = true;
        this.reconnectAttempts = 0;
      });
      
      this.ws.on('message', (data) => {
        this.handleEmulatorMessage(data.toString());
      });
      
      this.ws.on('close', () => {
        logger.log("Connection to emulator closed");
        this.connected = false;
        this.scheduleReconnect();
      });
      
      this.ws.on('error', (error) => {
        logger.error(`WebSocket error: ${error.message}`);
        this.connected = false;
        this.scheduleReconnect();
      });
    } catch (error) {
      logger.error(`Failed to connect: ${error.message}`);
      this.scheduleReconnect();
    }
  }
  
  scheduleReconnect() {
    if (this.reconnectAttempts < 10) {
      const delay = Math.min(1000 * Math.pow(2, this.reconnectAttempts), 30000);
      logger.log(`Scheduling reconnect in ${delay}ms (attempt ${this.reconnectAttempts + 1})`);
      
      setTimeout(() => {
        this.reconnectAttempts++;
        this.connectToEmulator();
      }, delay);
    } else {
      logger.error("Failed to reconnect after multiple attempts. Please restart the emulator and this script.");
    }
  }
  
  handleEmulatorMessage(message) {
    // Parse messages from the emulator script (paste.txt)
    const parts = message.split('||');
    if (parts.length < 2) return;
    
    const [type, content] = parts;
    
    switch(type) {
      case 'map.position':
        const [x, y] = content.split('|').map(Number);
        this.gameState.position = { x, y };
        break;
      case 'map.name':
        this.gameState.map = content;
        break;
      case 'battle.status':
        this.gameState.isInBattle = content === 'true';
        break;
      // Add other message types as needed
    }
  }
  
  sendToEmulator(command) {
    if (!this.connected) return;
    
    try {
      this.ws.send(command);
    } catch (error) {
      logger.error(`Failed to send command: ${error.message}`);
    }
  }
  
  executeAction(action) {
    if (!action) return;
    
    switch(action.type) {
      case 'PRESS_BUTTON':
        this.sendToEmulator(`input.button||${action.button.toLowerCase()}`);
        break;
      case 'REQUEST_PATH':
        this.sendToEmulator(`path.request||${action.target.x},${action.target.y}`);
        break;
    }
  }
  
  mainLoop() {
    // Process player reports
    Supervisor.processPlayerReports();
    
    // Player decides next action
    const action = Player.processGameState(this.gameState);
    
    // Execute action
    this.executeAction(action);
  }
}

// Start the controller
const controller = new PokemonController();
controller.start();