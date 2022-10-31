local wk = require('which-key')
local command_center = require('command_center')
local noremap = { noremap = true }

-- Register keybinds to control barbar
wk.register({
    ["<space>"] = {
        b = {
            name = "+barbar"
        }
    }
})

local tabline_sort_picker = require('config.tabline-sort-picker')

command_center.add({
    {
        desc = "Close current buffer",
        category = "tabline",
        cmd = function() vim.cmd('BufferClose') end,
        keys = { "n", "<space>bc", noremap }
    },
    {
        desc = "Pick buffer",
        category = "tabline",
        cmd = function() vim.cmd('BufferPick') end,
        keys = { "n", "<space>bp", noremap }
    },
    {
        desc = "Pick tabline sort mode",
        category = "tabline",
        cmd = function()
            tabline_sort_picker.pick_tabline_sort_mode({
                ['Buffer Number'] = function() vim.cmd('BufferOrderByBufferNumber') end,
                ['Directory']     = function() vim.cmd('BufferOrderByDirectory') end,
                ['Language']      = function() vim.cmd('BufferOrderByLanguage') end,
                ['Window Number'] = function() vim.cmd('BufferOrderByWindowNumber') end
            })
        end,
        keys = { "n", "<space>bs", noremap }
    }
})

