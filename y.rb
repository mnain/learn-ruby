# y.rb
# $Id$

require 'net/http'

if (ARGV.empty?) then
	STDERR.puts "Need url"
	exit
end

ARGV.each { |url|
http = Net::HTTP.new(url,80)
resp,data = http.get('/', nil)
resp.each { |k,v|
	puts "#{k} = #{v}"
}
puts "-"*25
puts data
}
