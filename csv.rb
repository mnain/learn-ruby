# try reading a csv file

require 'pp'
require 'fastercsv'

begin
	csvFile = "addr.csv"
	FasterCSV.foreach(csvFile) { |row|
		name = row[1] + " " + row[0]
		email = row[2]
		homeTel = row[3]
		cell = row[4]
		puts "#{name},#{email},#{homeTel},#{cell}"
	}
rescue 
	puts "Error"
end

