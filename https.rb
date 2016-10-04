#!/usr/local/bin/ruby

require 'webrick'
require 'webrick/https'

s = WEBrick::HTTPServer.new(
  :Port            => 2000,
  #:DocumentRoot    => Dir::pwd + "/htdocs",
  :DocumentRoot    => Dir::pwd,
  :SSLEnable       => true,
  :SSLVerifyClient => ::OpenSSL::SSL::VERIFY_NONE,
  :SSLCertName => [ ["C","JP"], ["O","WEBrick.Org"], ["CN", "WWW"] ]
)
trap("INT"){ s.shutdown }
s.start

