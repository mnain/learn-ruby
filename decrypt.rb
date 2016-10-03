require 'openssl'
require 'digest/sha1'
secretFile = ".secret"

c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
c.decrypt
iv = c.random_iv
key = Digest::SHA1.hexdigest("S@cr0tK@y")
fh = File.open(secretFile, 'r')
encrypted = fh.readline.chomp
iv = fh.readline.chomp
fh.close
puts encrypted
puts iv
c.key = key
c.iv = iv
puts "Original: #{encrypted}\n"
puts "Length: #{encrypted.length}\n"
d = c.update(encrypted)
d << c.final
puts "decrypted: #{d}\n"

