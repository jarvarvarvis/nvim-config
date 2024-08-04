local wk = require('which-key')

vim.g.floaterm_width = 100
vim.g.floaterm_winblend = 0

-- Rounded corners
local borders = require("config.borders")
vim.g.floaterm_borderchars = borders.border_character_string

wk.add({
    { "<space>T", function() vim.cmd("FloatermToggle") end, desc = "Open floaterm" },
})
