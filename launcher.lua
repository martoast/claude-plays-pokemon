-- launcher.lua
socket = require "socket"
server = socket.bind("127.0.0.1", 8888)
-- Set connection to non-blocking mode
server:settimeout(0)

function onFrame()
  -- Check for connections
  local client = server:accept()
  if client then
    client:settimeout(0)
    print("Connection established!")
    -- Handle communication with the Node.js app
    -- This would receive commands and send game state
  end
  
  -- Rest of the frame handling code
end

-- Register our callback for each frame
callbacks:add("frame", onFrame)