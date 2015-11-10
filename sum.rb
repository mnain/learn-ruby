# ruby
# sum of numbers from 1...n

if (ARGV.empty?) then
	STDERR.puts "Need number n to compute sum of"
	exit
end
num = 10
begin
num = ARGV[0].to_i
rescue
	STDERR.puts "Could not convert number #{ARGV[0]}"
end

puts "Num = #{num}"
if (num > 1) then
	sum = 0
	(1..num).each do |i|
		print "#{i} "
		sum += i
	end
	puts
	altSum = num * (num + 1) / 2
	puts "Sum #{sum} #{altSum}"
end

