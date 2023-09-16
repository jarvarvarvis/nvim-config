local commander = require('commander')
local wk = require('which-key')

local noremap = { noremap = true }

vim.g.floaterm_width = 100
vim.g.floaterm_winblend = 0

-- Rounded corners
local borders = require("config.borders")
vim.g.floaterm_borderchars = borders.border_character_string

wk.register({
    ["<space>"] = {
        T = { "Open floaterm" }
    }
})

commander.add({
    {
        desc = "Open floaterm",
        cat = "floaterm",
        cmd = function() vim.cmd("FloatermToggle") end,
        keys = { "n", "<space>T", noremap }
    }
})
