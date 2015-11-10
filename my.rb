# ruby

require 'mysql'

db = 'blog'
user = 'root'
pass = 'abc123'
mysql = Mysql.connect('localhost', user, pass, db)
rs = mysql.query('show tables')
rs.each { |tab|
	count = mysql.query("select count(*) from #{tab}")
	count.each { |c|
		puts "Count : #{tab} : #{c}"
	}
}
