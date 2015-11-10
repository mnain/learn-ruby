require 'net/pop'
pop = Net::POP3.new('mail.nain.cc')
pop.start('nain1f4', 'wak89giv') do |p|
  puts "# msgs : #{p.mails.size}"
  p.mails.each { |msg|
 
  # Print the 'From:' header line
  puts msg.header.split("\r\n").grep(/^From: /)
 
  # Put message to $stdout (by calling <<)
  #puts "\nFull message:\n"
  #msg.delete
  }
end
