# Loosely based on: https://rubytalk.org/t/issue-with-threads-and-socket-accept/42923

#######
# WIP #
#######

require 'socket'

class MyServer
  def initialize(host: "127.0.0.1", port: 9999)
    @socket = TCPServer.new(host, port)
  end

  def handle(client)
    begin
      lines = 0
      lines += 1 while client.gets
      puts "Got #{lines} lines."
    rescue Exception => e
      print "exception: "; p e
    ensure
      client.close
    end
  end

  def serve_multi_thread
    while client = @socket.accept
      Thread.new(client) { |c| handle(c) }
    end
  end

  def serve_single_thread
    while client = @socket.accept
      handle(client)
    end
  end

  def shutdown
    return nil if @socket.nil? or @socket.closed?
    puts "Shutting down..."
    @socket.close
  end
end

server = MyServer.new
Signal.trap("INT") { server.shutdown }
server.serve_mt
