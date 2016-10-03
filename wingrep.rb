#! /usr/local/bin/ruby

# ===================================
# WinGrep.rb
#
# A grep displaying pre/post lines
#
# Version 0.5
# ===================================

require 'ringbuf'
require 'getoptlong'

class Filter
    BEFORE = 1
    AFTER  = 2

    def initialize(regex, precount=3, postcount=1)
        @buffer = RingBuffer.new(precount)
        @postcount = postcount
        @regex = regex
        @state = BEFORE
        @counter = 0
    end

    def procbefore(line, &block)
        if line =~ @regex
            @buffer.each{ |pl| 
                block.call pl 
            }
            @buffer.clear
            block.call line
            @state = AFTER
        else
            @buffer.push( line )
        end
    end

    def procafter(line, &block)
        if line =~ @regex
           yield line
           @counter = 0
        else
           if @counter < @postcount
              block.call line
              @counter += 1
           else
              @buffer.push(line)
              @state = BEFORE
              @counter = 0
           end
        end
    end

    def wgrepFilter(line=$_, &block)
        case @state
        when BEFORE
            procbefore line, &block
        when AFTER
            procafter line, &block
        else
            puts "INTERNAL STATE ERROR"
        end
    end #def

end #class

def usage
      puts "Usage: wgrep.rb [OPTIONS] searchexpression file ..."
      puts "       -b|--before    number of lines to display before match (default: 3)"
      puts "       -a|--after     number of lines to display after match (default: 1)"
      puts "       -h|--help        print this"
      p 
      exit
end

usage if ! ARGV[0]
parser = GetoptLong.new(['-b', '--before',     GetoptLong::REQUIRED_ARGUMENT ],
                        ['-a', '--after',      GetoptLong::REQUIRED_ARGUMENT ],
                        ['-h', '-u', '--help', GetoptLong::NO_ARGUMENT ]
                       )   
precount  = 3
postcount = 1
parser.each { |opt, arg| 
    precount  = arg.to_i if opt == "-b" 
    postcount = arg.to_i if opt == "-a" 
    usage     if opt == "-h" 
}
regex = Regexp.new(ARGV.shift)
f = Filter.new(regex, precount, postcount)
while gets
   f.wgrepFilter($_) { |out|  puts out }
end
