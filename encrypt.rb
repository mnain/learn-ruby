#!/usr/bin/ruby
#
require 'openssl'
require 'digest/sha1'

secretFile = ".secret"

c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
c.encrypt
# your pass is what is used to encrypt/decrypt
c.key = key = Digest::SHA1.hexdigest("S@cr0tK@y")
c.iv = iv = c.random_iv
e = c.update("P@ssword!2010")
e << c.final
puts "encrypted: #{e}\n"
puts "length: #{e.length}\n"
puts "iv: #{iv}\n"
fh = File.new(secretFile, 'w')
puts "="*20+"enc"+"="*20
e.split(//).each { |c|
	hexValue = sprintf "%02X",c[0]
	puts "#{c} #{hexValue}"
	fh.print hexValue
}
fh.print "\n"
puts "="*20+"iv"+"="*20
iv.split(//).each { |c|
	hexValue = sprintf "%02X",c[0]
	puts "#{c} #{hexValue}"
	fh.print hexValue
}
fh.print "\n"
fh.close

