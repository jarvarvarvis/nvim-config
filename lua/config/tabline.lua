local wk = require('which-key')
local commander = require('commander')
local noremap = { noremap = true }

-- Register keybinds to control barbar
wk.register({
    ["<space>"] = {
        b = {
            name = "+barbar",
            c = { "Close current buffer" },
            p = { "Pick buffer" },
            s = { "Pick tabline sort mode" },
        }
    }
})

local tabline_sort_picker = require('config.tabline-sort-picker')

commander.add({
    {
        desc = "Close current buffer",
        cat = "tabline",
        cmd = function() vim.cmd('BufferClose') end,
        keys = { "n", "<space>bc", noremap }
    },
    {
        desc = "Pick buffer",
        cat = "tabline",
        cmd = function() vim.cmd('BufferPick') end,
        keys = { "n", "<space>bp", noremap }
    },
    {
        desc = "Pick tabline sort mode",
        cat = "tabline",
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

