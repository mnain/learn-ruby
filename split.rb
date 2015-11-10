# *ruby*
#

if ARGV.empty? then
	puts "Need filename"
	exit
end

puts "to open #{ARGV[0]}"
fin = File.open(ARGV[0])
fin.each_line { |lin|

	matchDir = lin.split(/ /)
	#puts "#{lin.chomp} size=#{matchDir.size}"
	puts matchDir[1]
	
}
