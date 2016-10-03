require 'yaml'
require 'active_record'

obj = {'name' => '1', 'description' => 'Item 1'}
# p obj
fName = "values.yaml"

ActiveRecord::Base.establish_connection(
    :adapter => "oci", 
    :username => "mnain", 
    :password => "oracle", 
    :host => "localhost")


class TodoList < ActiveRecord::Base
	set_table_name 'todo_lists'
end

#td = TodoList.new(:id => 1, :name => 'Name', :description => 'Value', :last_update => Time.now)
#p td
#exit

value = "List 4"
100.times do 
File.open(fName, "r") {|f| obj = YAML.load(f) } if (File.exists?(fName))
todoList = TodoList.new
todoList.name = obj['name']
todoList.description = obj['description']
todoList.last_update = Time.now
p todoList
newName = obj['name'].to_i + 1
# p newName
obj['name'] = newName.to_s
obj['description'] = "This is item "+newName.to_s
p obj
todoList.save
File.open(fName, "w") {|f| YAML.dump(obj, f)}

end