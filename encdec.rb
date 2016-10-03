require 'openssl'
require 'digest/sha1'
secretFile = ".secret"
c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
c.encrypt
# your pass is what is used to encrypt/decrypt
c.key = key = Digest::SHA1.hexdigest("yourpass")
c.iv = iv = c.random_iv
e = c.update("Abc$!123")
e << c.final
puts "encrypted: #{e}\n"
puts "length: #{e.length}\n"
fh = File.new(secretFile, 'w')
fh.puts e
fh.puts iv
fh.close
#c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
#c.decrypt
#c.key = key
#c.iv = iv
#d = c.update(e)
#d << c.final
#puts "decrypted: #{d}\n"
#fh = File.open(secretFile, 'r')
#line = fh.readline
#fh.close
#p line
#
