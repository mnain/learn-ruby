#!/opt/third-party/bin/ruby
#
# $Id: servlet.rb,v 1.1 2005/07/23 00:41:37 madan Exp madan $
#
# SERVLET_RB
#

require 'webrick'
include WEBrick

s = HTTPServer.new(
    :Port => 8085
    )

# HTTPServer#mount(path, servletclass)
#   When a request referring "/hello" is received,
#   the HTTPServer get an instance of servletclass
#   and then call a method named do_"a HTTP method".

class HelloServlet < HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res.body = "<HTML>"
	res.body += "<head>"
	res.body += '<link rel="shortcut icon" href="favicon.ico" >'
	res.body += "</head>"
	res.body += "hello, world.</HTML>"
    res['Content-Type'] = "text/html"
  end
end

s.mount("/", HTTPServlet::FileHandler, "c:\\learn\\ruby\\index.html", true)

s.mount("/hello", HelloServlet)

# HTTPServer#mount_proc(path){|req, res| ...}
#   You can mount also a block by `mount_proc'.
#   This block is called when GET or POST.

s.mount_proc("/hello/again") {|req, res|
  res.body = "<HTML>hello (again)</HTML>"
  res['Content-Type'] = "text/html"
}

s.mount_proc("/hello/madan") { |req,res|
    res.body = "<html>"
    res.body += "<head><title>Hello Madan</title></head>"
    res.body += 'Welcome to http://mnain.dyndns.org:8085/'
    res.body += "<table border=1>"
    res.body += "<tr><td>Hello world</td></tr>"
    res.body += "</table>"
    res.body += "<br>"
    res['Content-Type'] = 'text/html'
}

s.mount_proc("/now") { |req,res|
    currentTime = Time.now
    res.body = "<HTML>"
    res.body += "#{currentTime} (PST)"
    res.body += "<br>"
    res.body += "#{currentTime.gmtime} (GMT)"
    res.body += "<br>"
    res.body += "</html>"
    res['Content-Type'] = "text/html"
}

trap("INT"){ s.shutdown }
s.start
