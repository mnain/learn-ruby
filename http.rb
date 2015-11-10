#!/usr/local/bin/ruby

require 'webrick'

docRoot = "C:\\htdocs"

s = WEBrick::HTTPServer.new(
  :Port            => 3000,
  :DocumentRoot    => docRoot
)

trap("INT"){ s.shutdown }
s.start

