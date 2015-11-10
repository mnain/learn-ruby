require 'net/smtp'
require 'rubygems'
require 'mailfactory'

filename = 'emaillist.csv'
mail = MailFactory.new()
mail.to = "mnain@yahoo.com"
mail.from = "madan@mnain.org"
mail.subject = "DLF Jasola for Lease"
mail.text = <<EOF1
	DLF Commercial office Space for Lease in tower A.ready for possession in Jan 09.

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

#print mail.to_s

#Net::SMTP.start(('mnain.org','madan@mnain.org','wak89giv') { |smtp|
#mail.to = 'mnain@yahoo.com'
#smtp.send_message(mail.to_s(), fromaddress, toaddress)
#}

smtp = Net::SMTP.new('mail.mnain.org')
#p smtp
smtp.start('mnain.org','madan@mnain.org','wak89giv')

msg = mail.to_s
#p smtp
smtp.sendmail(msg, 'madan@mnain.org', 'mnain@yahoo.com')
smtp.sendmail(msg, 'madan@mnain.org', 'madan.nain@gmail.com')
smtp.finish()