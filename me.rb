# me.rb - use mechanize from ruby
# $Id$

require 'mechanize'

agent = WWW::Mechanize.new
page = agent.get('http://mail.yahoo.com')

#puts page.forms[0].fields[0].name
#puts page.forms[0].fields[0].value
#exit

form = page.forms[0]

form.fields.find { |f| f.name == 'login'}.value = "mnain"
form.fields.find { |f| f.name == 'passwd'}.value = '28Krishn'
page = agent.submit(form)
link = page.links[0]
page = agent.click(link)
puts page.body

