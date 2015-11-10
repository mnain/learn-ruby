#!/usr/local/bin/ruby

require 'webrick'

s = WEBrick::HTTPServer.new(
  :Port            => 3000,
  :DocumentRoot    => Dir::pwd
)

s.mount(
	"/cgi-bin",
	WEBrick::HTTPServlet::FileHandler,
	Dir::pwd+"/cgi-bin"
)
trap("INT"){ s.shutdown }
s.start

