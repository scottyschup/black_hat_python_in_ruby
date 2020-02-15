# Seitz - p12 TCP Server

require "socket"

bind_ip = "0.0.0.0"
bind_port = 9999

server = TCPServer.new(bind_ip, bind_port)
$stdout.puts "Listening on #{bind_ip}:#{bind_port}"

Signal.trap("INT") do
  return if !defined? server || server.nil? || server.closed?
  server.close
  exit
end

loop do
  client = server.accept # Wait for a client to connect
  _, remote_port, remote_hostname, remote_ip = client.peeraddr
  request = client.gets
  $stdout.puts "\n#{Time.now}: Accepting incoming connection from #{remote_ip}:#{remote_port}"
  $stdout.puts "#{Time.now}: Request: #{request}"

  client.print "HTTP/1.1 200\r\n"
  client.print "Content-Type: text/html\r\n"
  client.print "\r\n"
  client.print "Hello #{remote_hostname}!"

  client.close
end
