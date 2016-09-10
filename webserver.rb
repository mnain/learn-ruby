# ruby script for web server
require 'socket'
port = (ARGV[0] || 6090).to_i
puts "Launch webserver on port #{port}"
server = TCPServer.new('localhost', port)
while (session = server.accept)
  puts "Request: #{session.gets}"
  session.print "HTTP/1.1 200/OK\r\nContent-type: text/html\r\n\r\n"
  session.print "<html><body><h1>Hello : #{Time.now}</h1></body></html>\r\n"
  session.close
end
