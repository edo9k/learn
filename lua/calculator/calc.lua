local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

-- Initialize GTK
Gtk.init(nil)

-- Create a window
local window = Gtk.Window {
    title = "Calculadora com Lua e Gtk",
    default_width = 400,
    default_height = 400,
}

-- Create an Entry widget to display the input and result
local entry = Gtk.Entry()
entry:set_alignment(1)
entry:set_hexpand(true)
entry:set_editable(false)

-- Create a grid for arranging buttons
local grid = Gtk.Grid()
grid:set_row_spacing(5)
grid:set_column_spacing(5)

local button_width  = 20
local button_height = 20

-- Define button labels
local buttons = {
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "C", "0", "=", "+",
}

-- Function to handle button clicks
local function button_click(button_label)
    local current_text = entry:get_text()
    if button_label == "C" then
        entry:set_text("")
    elseif button_label == "=" then
        local expression = current_text
        local success, result = pcall(loadstring("return " .. expression))
        if success then
            entry:set_text(tostring(result))
        else
            entry:set_text("Error")
        end
    else
        entry:set_text(current_text .. button_label)
    end
end

-- Create and connect buttons
for i, button_label in ipairs(buttons) do
    local button = Gtk.Button { label = button_label }
    button.on_clicked:connect(function()
        button_click(button_label)
    end)

    local column = (i - 1) % 4 * button_width
    local row = math.floor( (i - 1) / 4 ) * button_height

    -- add button to grid
    grid:attach(button, column, row, button_width, button_height) 
end

-- Create a vertical box to arrange the widgets
local vbox = Gtk.Box {
    orientation = "VERTICAL",
    spacing = 5,
    margin = 10,
}

-- Add the Entry and Grid to the VBox
vbox:pack_start(entry, false, false, 0)
vbox:pack_start(grid, true, true, 0)

-- Add the VBox to the window
window:add(vbox)

-- Connect the "destroy" signal to exit the application
window.on_destroy = function()
    Gtk.main_quit()
end

-- Show all widgets
window:show_all()

-- Start the GTK main loop
Gtk.main()

