function stopSocket()
    -- Do nothing
  end
  
  function socketError(err)
    -- Do nothing
  end
  
  function socketReceived()
    -- Do nothing
  end
  
  function sendMessage(messageType, content)
    -- Output to console instead of sending via socket
    console:log(messageType .. ": " .. content)
  end
  
  function startSocket()
    console:log("Socket functionality disabled")
    -- Don't attempt to create a socket
  end