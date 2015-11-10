# ruby servlet example
#

require 'webrick'
include WEBrick

s = HTTPServer.new(
  :Port            => 8085,
  :DocumentRoot    => Dir::pwd
)

showTime = Proc.new { |req,res|
	res['Content-Type'] = 'text/html'
	res.body = "Time now is #{Time.now}<br>"
	res.body += "GMT : #{Time.now.gmtime}"
}

## mount subdirectories

s.mount("/home", HTTPServlet::FileHandler, "c:\\learn\\ruby\\index.html", true)  #<= allow to show directory index.
s.mount("/ipr", HTTPServlet::FileHandler, "c:\\learn\\ruby\\", true)

s.mount("/now", HTTPServlet::ProcHandler.new(showTime))

# this is a comment in ruby
trap("INT"){ s.shutdown }
s.start
