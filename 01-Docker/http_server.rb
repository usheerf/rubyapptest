require 'socket'

server  = TCPServer.new('0.0.0.0', 80)

loop {
  client  = server.accept
  request = client.readpartial(2048)
  
  method, path, version = request.lines[0].split

  puts "#{method} #{path} #{version}"

# Based on my quick reaading on below I have done my best to alter this code
# https://blog.appsignal.com/2016/11/23/ruby-magic-building-a-30-line-http-server-in-ruby.html
  if path == "/healthcheck"
    client.print "HTTP/1.1 200\r\n" 
    client.print "Content-Type: text/html\r\n"
    client.print "\r\n"
    client.print "OK\r\n"
  else
    client.print "HTTP/1.1 200\r\n" 
    client.print "Content-Type: text/html\r\n"
    client.print "\r\n"
    client.print "Well, hello there!\r\n"
  end

  client.close
}


