# ruby

require 'win32ole'

ie = WIN32OLE.new('InternetExplorer.Application')
#js = ie.document.script
#js.alert(prompt)
#r = js.confirm(prompt)
#r = js.input(prompt)
#p r
ie.Visible = true
sleep(1) until ie.ReadyState == 4
ie.Navigate("http://www.google.com")
sleep(1) until ie.ReadyState == 4
