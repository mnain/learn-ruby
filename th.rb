# ruby
# threaded example

require 'thread'

def myLoop(thrId, nTimes)
	(0 .. nTimes.to_i).each { |index|
		puts "#{thrId} #{index} #{Time.now.usec}"
		#sleep 0.1
	}
end

threadArray = Array.new
loopTimes = 5000
(0..5).each { |x|
threadArray[x] = Thread.new { myLoop(x,loopTimes) }
}

threadArray.each { |thr|
	thr.join
}
