local command_center = require('command_center')

local noremap = { noremap = true }

vim.g.floaterm_width = 100
vim.g.floaterm_winblend = 0

command_center.add({
    {
        desc = "Open floaterm",
        category = "floaterm",
        cmd = function() vim.cmd("FloatermToggle") end,
        keys = { "n", "<space>T", noremap }
    }
})
