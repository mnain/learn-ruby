# hexdump

if ARGV.empty? then
	# then assume input is STDIN
	fileHandle = STDIN
else
	fileHandle = File.open(ARGV[0], "r")
end
indx = 0
addr = 0
asciiValues = Array.new
(0..16).each { |x|
	asciiValues[x] = 0
}
fileHandle.each_byte { |byte|
	asciiValues[indx] = byte
	if (0 == indx) then
		printf "%08X ",addr
		addr += 16
	end
	printf "%02X",byte&0xFF
	indx = indx.succ
	if (8 == indx) then
		print "  "
	end
	if (16 == indx) then
		print "  "
		(0..16).each { |i|
			if  (asciiValues[i] >= 0x20 && asciiValues[i] <= 0x7e) then
				printf "%c",asciiValues[i]
			else
				print "."
			end
		}
		puts
		indx = 0
	end
}

if (0 != indx) then
	(indx..16).each { |i|
		print "  "
		asciiValues[i] = 0
		indx = indx.succ
		if (8 == indx) then
			print "  "
		end
		if (16 == indx) then
			print "  "
			(0..16).each { |j|
				if  (asciiValues[j] >= 0x20 && asciiValues[j] <= 0x7e) then
					printf "%c",asciiValues[j]
				else
					print "."
				end
			}
		end
	}
end
puts

