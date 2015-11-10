require 'tk'

root = TkRoot.new() { title "Packing Example" }

menu_spec = [
  [ ['File', 0],
    ['New File',  proc{new_file}],
    ['Open File', proc{open_file}],
    '---',
    ['Save File', proc{save_file}],
    ['Save As',   proc{save_as}],
    '---',
    ['Quit',      proc{exit}]
  ],
  [ ['Edit', 0],
    ['Cut',       proc{cut_text}],
    ['Copy',      proc{copy_text}],
    ['Paste',     proc{paste_text}]
  ]
]
TkMenubar.new(nil, menu_spec, 'tearoff'=>false).pack('fill'=>'x', 'side'=>'top')
Tk.mainloop()
