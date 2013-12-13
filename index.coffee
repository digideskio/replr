repl = require('repl')
ReplrServer = require('./src/ReplrServer')
ReplrWorkerPassthrough = require('./src/ReplrWorkerPassthrough')

# Expose simple REPL creation and worker REPL options
funcs = 
  create: ()-> 
    return ReplrServer.apply(Object.create(ReplrServer.prototype), arguments)

  configureAsWorker: (options)-> 
    ReplrWorkerPassthrough::workerOptions = options

# Setup passthrough by listening to process messages from cluster host process
ReplrWorkerPassthrough::setup()

module.exports = funcs
