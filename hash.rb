#!/usr/bin/ruby
#

myhash = { :foo => 1, "x" => nil, 3 => ['n',4,-1]}
once = 0
myhash.keys.each { |k|
	puts myhash[k]
}

