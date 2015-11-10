#!ruby
#

require 'fastercsv'
require 'net/smtp'

#filename = 'addr.txt'
filename = 'emaillist.csv'
#lettername = 'jasola_letter.txt'
#lettername = 'jasola_ad_08_20_2008.txt'
lettername = "DlfAd_Nov18_2008.txt"

def sendMsg(name,email,body)
puts "To:#{email}"
#puts "Hello #{name},"
#puts body.join(' ')
smtp = Net::SMTP.new('mail.mnain.org')
#p smtp
smtp.start('mnain.org','madan@mnain.org','wak89giv')
msg = "Subject: DLF Jasola 3850 sq ft for Lease\r\n" +
      "From: Geeta Kassal <jasola@mnain.org>\r\n" +
	  "\r\n" +
	  "Hello #{name}\r\n"
body.each { |l|
		msg += l
	}
#puts msg


#p smtp
smtp.sendmail(msg, 'madan@mnain.org', email)
smtp.finish()
sleep 2
end

fp = nil
begin
fp = File.open(lettername, 'r')
rescue
end

if fp.nil? then
	STDERR.puts "Unable to access #{lettername}"
	exit -1
end

if !File.exists? filename then
	STDERR.puts "Unable to access #{filename}"
	exit -2
end

letterBody = Array.new
fp.each_line { |l|
	letterBody.push l
}
fp.close

#sendMsg('Madan','mnain@yahoo.com',letterBody)
#sendMsg('Geeta','geetanain@gmail.com',letterBody)
#exit

#p letterBody
FasterCSV.foreach(filename) { |row|
	sendMsg(row[0],row[1],letterBody)
	#puts "#{row[0]} : #{row[1]}"
}

# puts letterBody.join(' ')
