# ruby
# column.rb
# extract a column from a multi column file
#

if (ARGV.empty?) then
	STDERR.puts "Need filename"
	exit
end

# note first argument must be filename, second must be column
fileName = ARGV[0]
columnStr = ARGV[1]
puts "Filename = #{fileName} Column = #{columnStr}"

if (FileTest.exists?(fileName)) then
	lineNum = 1
	fin = File.open(fileName)
	fin.each_line { |line|
		elements = line.split(/ /)
		if (elements.size < columnStr.to_i) then
			STDERR.puts "#{lineNum} does not have #{columnStr} columns"
		else
			colNum = columnStr.to_i - 1
			puts elements[colNum]
		end
		lineNum = lineNum.succ
	}
	fin.close
end

