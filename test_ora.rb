require 'dbi'
dbh = DBI.connect('DBI:OCI8:xe', 'mnain', 'oracle')
# dbh.select_all('select * from asset_track') do | row |  p row ; end
p dbh.methods.sort
#p dbh.tables
p dbh.ping
dbh.disconnect
