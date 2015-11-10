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
mail.subject = "Single unit Townhouse in Palam Vihar for sale."
mail.text = <<EOF1
Hello #{name}
	
2 Commercial units in Jalandhar- in Nakodar Chowk for SALE!!
units # 316 and # 416 each of 1608 sq feet , so it is a total of 3200 sq feet.
Possession in Oct 09. It is under construction.

This is a construction-linked programme 57 Lakhs approximately have been
paid to the company for each flat as on date.
 
http://www.sirohiestates.com/the-galleria.html#


Jalandhar has a huge appreciation potential as the city has:
The highest number of NRI's in the country,
 
Located on Nakodar Chowk, Galleria will be an exquisitely designed
shopping mall. It will represent an effective blend of retail outlets,
commercial office space, food court, wide range of restaurants and
cafes. Adequate parking space. Number of Floors: Retail - 3 floors,
Commercial - 3 floors Located on the road leading from Jyoti Chowk to
Nakodar Chowk, opposite lal ratna cinema.375 Kms from Delhi, 65 Kms from
Ludhiana, 87 Kms from Amritsar, 143 Kms from Chandigarh, 239 Kms from
Simla.

Please call New Delhi- Sanjeev at 9810367063 or Saroj at 24331044.
EOF1

mail.html = <<EOF2

	Hello #{name}

	<p>2 Commercial units in Jalandhar- in Nakodar Chowk for SALE!!
	units # 316 and # 416 each of 1608 sq feet , so it is a total of 3200 sq feet.
	Possession in Oct 09. It is under construction.</P>

	<p>This is a construction-linked programme 57 Lakhs approximately have been
	paid to the company for each flat as on date.</p>
	 
	<p><a href="http://www.sirohiestates.com/the-galleria.html#">Click here for pictures</a></p>


	<p>Jalandhar has a huge appreciation potential as the city has:
	<ul>
	<li>The highest number of NRI's in the country,</li>
	</ul>
	<p>Located on Nakodar Chowk, Galleria will be an exquisitely designed
	shopping mall. It will represent an effective blend of retail outlets,
	commercial office space, food court, wide range of restaurants and
	cafes. Adequate parking space. Number of Floors: Retail - 3 floors,
	Commercial - 3 floors Located on the road leading from Jyoti Chowk to
	Nakodar Chowk, opposite lal ratna cinema.375 Kms from Delhi, 65 Kms from
	Ludhiana, 87 Kms from Amritsar, 143 Kms from Chandigarh, 239 Kms from
	Simla.</p>

	<p>Please call New Delhi- Sanjeev at 09810367063 or Saroj at 011-24331044.</p>
	 
	<p>with best wishes</p>
	<p><i>Geeta</i></p>
	
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
