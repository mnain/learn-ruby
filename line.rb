# line.rb

=begin
line.rb - return all non-comment line (comment character is #)
useful in scripts where have a value per line
=end

begin
	fileName = ARGV[0]
rescue
	fileName = "data.txt"
end

if (File.exists? fileName) then
	fin = File.open(fileName)
	fin.each_line { |lin|
		oneLine = lin.chomp.strip
		puts oneLine if (oneLine.grep(/^#/).empty?)
	}
end
