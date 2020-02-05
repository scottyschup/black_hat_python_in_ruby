require "socket"

bind_ip = "0.0.0.0"
bind_port = 8888

server = UDPSocket.new
server.bind(bind_ip, bind_port)

Signal.trap("INT") do
  return if !defined? server || server.nil? || server.closed?
  server.close
  exit
end

$stdout.puts "Listening on #{bind_port}"

loop do
  data, (_, port, host, _) = server.recvfrom(4096)
  $stdout.puts "\n#{Time.now}: Receiving data"
  $stdout.puts "#{Time.now}: Data received from #{host}:#{port} => #{data}"
  server.send "Data received from #{host}:#{port}", 0, host, port
end
