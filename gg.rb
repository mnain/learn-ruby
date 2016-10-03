# ruby

def grep(line,regex) 
	if (line =~ $regex) then
		puts line
	end
	#p regex
end

def handleFileList(fileList,regex)
	#p regex
	if (fileList.size >= 1) then
		fileList.each { |f|
			fh = File.open(f, "r")
			fh.each_line { |line|
				if (line =~ regex) then
					puts line
				end
			}
		}
	end
end

if (ARGV.size < 1) then
	STDERR.puts "Need a pattern and filename"
	STDERR.puts "or at least a pattern"
	exit
end

if (ARGV.size >= 1) then
	pattern = ARGV[0]
end
# puts "Pattern : #{pattern}"
regex = Regexp.new(pattern, Regexp::IGNORECASE)
#p regex
fileList = Array.new
fromStdin = true

if (ARGV.size >= 2) then
	fromStdin = false
	fileList.clear
	(1..ARGV.size-1).each { |x|
		fileList.push ARGV[x]
	}
end

if (fromStdin) then
	while line = gets
		grep(line, regex)
	end
end
if (!fromStdin) then
	handleFileList(fileList,regex)
end

