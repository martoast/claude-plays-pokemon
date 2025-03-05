require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const Anthropic = require('@anthropic-ai/sdk');
const fs = require('fs');

const app = express();
const port = 8888;

// Initialize Anthropic client
const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY,
});

// Game state storage
const gameState = {
  position: { x: 0, y: 0 },
  map: "",
  inBattle: false,
  pokemon: [],
  lastUpdate: Date.now(),
  history: []
};

// Setup middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Log requests
app.use((req, res, next) => {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`);
  next();
});

// Claude system prompt
const systemPrompt = `You are a skilled Pokémon player who excels at navigating the game world and making strategic decisions.

Your task is to control a character in a Pokémon game by choosing which button to press. Your goal is to help the player make progress - explore the world, catch and train Pokémon, battle trainers, and eventually become the Pokémon League Champion.

When given information about the current game state, you must decide what single button to press from: UP, DOWN, LEFT, RIGHT, A, B, START, or SELECT.

Respond with ONLY the button name, and no other text or explanation.`;

// Claude conversation context
let claudeContext = []; // User and assistant messages only

// Handle both GET and POST for the update endpoint
app.all('/update', async (req, res) => {
  // For GET requests, data will be in query parameters
  const update = req.method === 'GET' ? req.query : req.body;
  
  if (update) {
    // Update game state
    if (update.position) {
      gameState.position = update.position;
    }
    if (update.map) {
      gameState.map = update.map;
    }
    if (update.inBattle !== undefined) {
      gameState.inBattle = update.inBattle === 'true' || update.inBattle === true;
    }
    if (update.pokemon) {
      gameState.pokemon = update.pokemon;
    }
    
    gameState.lastUpdate = Date.now();
    
    // Log state to file
    fs.appendFileSync(
      'game-log.txt', 
      `[${new Date().toISOString()}] ${JSON.stringify(update)}\n`
    );
    
    // Add to history
    gameState.history.push({
      timestamp: Date.now(),
      ...update
    });
    
    // Keep history at a reasonable size
    if (gameState.history.length > 100) {
      gameState.history.shift();
    }
  }
  
  res.json({ success: true });
});

// Endpoint to get next action from Claude
app.get('/action', async (req, res) => {
  try {
    // Create prompt based on current game state
    const prompt = `Current game state:
- Map: ${gameState.map || "Unknown"}
- Position: (${gameState.position?.x || 0}, ${gameState.position?.y || 0})
- In battle: ${gameState.inBattle ? "Yes" : "No"}
- Pokémon team: ${gameState.pokemon.length > 0 ? gameState.pokemon.map(p => `${p.species} (Lv${p.level}) HP: ${p.hp}/${p.maxHp}`).join(', ') : "None"}

Based on this information, what button should I press next? Choose exactly one from: UP, DOWN, LEFT, RIGHT, A, B, START, SELECT`;

    // Add prompt to context
    claudeContext.push({
      role: "user",
      content: prompt
    });
    
    // Keep context at a reasonable size
    if (claudeContext.length > 18) {
      // Remove oldest messages (but keep in pairs)
      claudeContext = claudeContext.slice(-18);
    }

    // Call Claude API with the updated format
    const response = await anthropic.messages.create({
      model: "claude-3-haiku-20240307",
      max_tokens: 100,
      temperature: 0.5,
      system: systemPrompt,
      messages: claudeContext
    });
    
    const action = response.content[0].text.trim();
    
    // Add Claude's response to context
    claudeContext.push({
      role: "assistant",
      content: action
    });
    
    // Log action to file
    fs.appendFileSync(
      'action-log.txt', 
      `[${new Date().toISOString()}] Claude decided: ${action}\n`
    );
    
    console.log(`Claude decided: ${action}`);
    res.json({ action });
  } catch (error) {
    console.error('Error getting action from Claude:', error);
    // Default action in case of error
    res.json({ action: 'A' });
  }
});

// Get current game state
app.get('/state', (req, res) => {
  res.json(gameState);
});

// Create log files if they don't exist
if (!fs.existsSync('game-log.txt')) {
  fs.writeFileSync('game-log.txt', '');
}
if (!fs.existsSync('action-log.txt')) {
  fs.writeFileSync('action-log.txt', '');
}

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});