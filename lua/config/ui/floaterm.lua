-- Take up 90% of screen space
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

-- Set corners
local borders = require("config.utility.borders")
vim.g.floaterm_borderchars = borders.string_cardinals_first_corners_second

-- Add keybind to toggle terminal
local wk = require("which-key")

wk.add({
    { "<space>T", function() vim.cmd("FloatermToggle") end, desc = "Open floaterm" },
})
