# Seitz - p11 UDP Client

require 'socket'

target_host = "127.0.0.1"
target_port = 8888

# client = Socket.new(Socket::AF_INET, Socket::SOCK_DGRAM)
# client.connect Socket.pack_sockaddr_in(target_port, target_host)
# client.puts "DATA DATA DATA"
# Alternately:
client = UDPSocket.new
client.send "DATA DATA DATA", 0, target_host, target_port
resp, _ = client.recvfrom(4096)

$stdout.puts "#{Time.now}: Data sent ✅"
$stdout.puts "#{Time.now}: Response => #{resp}"

client.close
