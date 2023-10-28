
-- import lua-lgi
local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

-- initialize gtk
Gtk.init(nil)

-- create window
local window = Gtk.Window {
  title = "Simple button example gui",
  default_width  = 300,
  default_height = 200
}

-- create button
local button = Gtk.Button {
  label = "Click me!"
}

-- add button to window
window:add(button)


-- click event function
function button:on_clicked()
  print("Button clicked.")
end

-- assign gtk quit to window destroy function
window.on_destroy = function()
  Gtk.main_quit()
end

-- show windows
window:show_all()

-- start gtk 
Gtk.main()
