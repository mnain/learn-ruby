require 'gtk2'
Gtk.init

window = Gtk::Window.new
button = Gtk::Button.new("Hello World")
button.signal_connect("clicked") { exit }
window.add(button)
window.show_all

Gtk.main

