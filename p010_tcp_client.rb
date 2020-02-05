# Seitz - p10 TPC Client

# AF_INET -- an address family that is used to designate the type of addresses
# that your socket can communicate with (in this case, Internet Protocol v4
# addresses). When you create a socket, you have to specify its address family,
# and then you can only use addresses of that type with the socket.
# https://stackoverflow.com/questions/1593946/what-is-af-inet-and-why-do-i-need-it
#
# SOCK_STREAM -- means that it is a TCP socket
# SOCK_DGRAM -- means that it is a UDP socket

require 'socket'

target_host = "127.0.0.1"
target_port = 9999

client = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
client.connect Socket.pack_sockaddr_in(target_port, target_host)
# Alternately:
# client = TCPSocket.new target_host, target_port

client.write "GET / HTTP/1.1\r\nHost: 127.0.0.1\r\n\r\n"
resp = client.recv(4096)

$stdout.puts resp
