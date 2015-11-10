require 'tk'


root = TkRoot.new() { title "Ruby/Tk Menu Example" }

bar = TkMenu.new()

sys = TkMenu.new(bar)
sys.add('command', 'label'=>"Quit", 'command'=>proc { root.destroy })
bar.add('cascade', 'menu'=>sys, 'label'=>"System")

file = TkMenu.new(bar)
file.add('command', 'label'=>"Open", 'command'=>proc { puts "Open..." })
file.add('command', 'label'=>"Close", 'command'=>proc { puts "Close..." })
bar.add('cascade', 'menu'=>file, 'label'=>"File")

root.menu(bar)

Tk.mainloop()
