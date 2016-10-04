#!/usr/local/bin/ruby

# global vars
$month = 6
$year = 2016

def procOne(a,b)
	puts "month = #{$month}, year = #{$year}"
	puts "procOne : a = #{a}, b = #{b}"
end

def procTwo(a,b)
	puts "month = #{$month}, year = #{$year}"
	puts "procTwo : a = #{a}, b = #{b}"
end

# == main ==
$month = Time.now.month
$year = Time.now.year
puts "month = #{$month}, year = #{$year}"
procOne(5,6)
procTwo(7,8)

