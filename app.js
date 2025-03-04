// app.js
import Player from './player.js';
import Supervisor from './supervisor.js';
import { connectToEmulator } from './emulator.js';

async function main() {
  // Connect to the emulator
  const emulator = await connectToEmulator('127.0.0.1', 8888);
  
  // Main loop
  while (true) {
    // Get game state from emulator
    const gameState = await emulator.getGameState();
    
    // Process player reports (from previous cycles)
    Supervisor.processPlayerReports();
    
    // Player processes any supervisor directives
    Player.processSupervisorDirectives();
    
    // Player decides next action based on game state
    const action = Player.processGameState(gameState);
    
    // Execute action in emulator
    const result = await emulator.executeAction(action);
    
    // Report result back to supervisor
    Player.reportAction(action, result);
    
    // Allow for performance monitoring and adjustments
    await processTelemetry();
  }
}

main().catch(error => {
  console.error('Main controller error:', error);
});