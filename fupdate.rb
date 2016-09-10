#!/usr/bin/env ruby

def newLine(msg,count) 
	msg+" "+count.to_s
end

fp = File.new("a.txt", "w")
fp.puts("test line 1")
fp.puts("test line 2")
fp.close()
v = 0..10
v.each { |x|
   puts x
}
puts newLine("Line",101)
