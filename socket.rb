require 'websocket-eventmachine-server'
require 'logger'
log = Logger.new('websocket.log')
EM.run do
  WebSocket::EventMachine::Server.start(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen do
      log.debug "Client connected"
    end

    ws.onmessage do |msg, type|
      log.debug "Received message: #{msg}"
      ws.send msg, :type => type
    end

    ws.onclose do
      log.debug "Client disconnected"
    end
  end

end