# require 'postgres-pr'
require 'postgres'

conn = PGconn.connect("localhost", 5432, "", "", "Learn", "postgres", "abc123")
res = conn.exec("select email from contact_info ordered order by email")
p res.num_fields
p res.cmdstatus
p res.fieldname(0)
p res.num_tuples
p res.getvalue(0,0)
p res.status
p PGresult::COMMAND_OK
res.each { |row|
	p row
}

