// communication.js
export const MessageQueue = {
    queues: {
      'player-to-supervisor': [],
      'supervisor-to-player': []
    },
    
    send(queue, message) {
      if (!this.queues[queue]) {
        throw new Error(`Queue ${queue} doesn't exist`);
      }
      
      this.queues[queue].push({
        ...message,
        timestamp: Date.now()
      });
    },
    
    receive(queue) {
      if (!this.queues[queue]) {
        throw new Error(`Queue ${queue} doesn't exist`);
      }
      
      const messages = [...this.queues[queue]];
      this.queues[queue] = [];
      return messages;
    }
  };