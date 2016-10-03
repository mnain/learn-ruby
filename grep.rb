# alt grep (g.rb)
# ruby

require 'grep'

if (ARGV.size < 2) then
	STDERR.puts "require pattern, file(s)"
	exit
end
(1...ARGV.size).each do |indx|
	p Grep::grep(ARGV[indx], ARGV[0])
end