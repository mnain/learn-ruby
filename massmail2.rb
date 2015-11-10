#!ruby
#

require 'fastercsv'
require 'net/smtp'
require 'mailfactory'

filename = 'addr.txt'
#filename = 'emaillist2.csv'
#lettername = 'jasola_letter.txt'
#lettername = 'jasola_ad_08_20_2008.txt'
#lettername = "DlfAd_Nov18_2008.txt"
lettername = 'palamvihar_ad_Jan_26_2009.txt'

def sendMsg(name,email,body)
puts "To:#{email}"
#puts "Hello #{name},"
#puts body.join(' ')
smtp = Net::SMTP.new('mail.mnain.org')
#p smtp
smtp.start('mnain.org','madan@mnain.org','wak89giv')
mail = MailFactory.new()
mail.to = "mnain@yahoo.com"
mail.from = "madan@mnain.org"
mail.subject = "DLF Jasola for Lease"
mail.text = <<EOF1
    Hello #{name}
	DLF Commercial office Space for Lease in tower A ready for possession in Jan 09.

	These are 3 adjacent units:

	JA 318   1706 sq feet
	JA 319   1072 sq feet
	JA 320    1072 sq feet

	Total Area 3850 sq feet Can be leased together or separate.

	All 3 above units have individual parking space. These are on the 3rd floor facing the main road.

	Contact information:

	Sanjeev Kassal 9810367063     Email: Sanjeev.kassal@gmail.com

	Geeta Kassal (USA) cell is 001-240-602-5555 Email: GeetaNain@gmail.com
EOF1

mail.html = <<EOF2
	<pre>
	<b>DLF Commercial office Space for Lease</b> in tower A.ready for possession in Jan 09.

	These are 3 adjacent units:

	JA 318   1706 sq feet
	JA 319   1072 sq feet
	JA 320    1072 sq feet

	Total Area 3850 sq feet Can be leased together or separate.

	All 3 above units have individual parking space. These are on the 3rd floor facing the main road.

	Contact information:

	<font color='blue'>Sanjeev Kassal 9810367063     <a href='mailto:Sanjeev.kassal@gmail.com'>Email</a>

	Geeta Kassal (USA) cell is 001-240-602-5555   <a href='mailto:GeetaNain@gmail.com'>Email</a>
	</font>
	</pre>
EOF2


#p smtp
smtp.sendmail(mail.to_s, 'madan@mnain.org', email)
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
