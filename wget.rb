#!/usr/bin/ruby
# wget.rb


#require 'open-uri'
#rc = 0
#begin
#rc = open('http://DC3400app01/enrollment/',
     #'User-Agent' => 'Ruby-Wget').read
#rescue
	#puts rc
#end

require 'net/http'
require 'net/https'
Net::HTTP.start('portal.it.fdca.census2010.gov') do |http|
response = http.get('/')
puts "Code = #{response.code}"
puts "Message = #{response.message}"
response.each {|key, val| printf "%14s = %40.40s\n", key, val }
p response.body
end