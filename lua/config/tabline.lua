local wk = require('which-key')
local tabline_sort_picker = require('config.tabline-sort-picker')

-- Register keybinds to control barbar
wk.register({
    ["<space>"] = {
        b = {
            name = "+barbar",
            c = {
                function()
                    vim.cmd('BufferClose')
                end,
                "Close current buffer"
            },
            p = {
                function()
                    vim.cmd('BufferPick')
                end,
                "Pick buffer"
            },
            s = {
                function()
                    tabline_sort_picker.pick_tabline_sort_mode({
                        ['Buffer Number'] = function()
                            vim.cmd('BufferOrderByBufferNumber')
                        end,
                        ['Directory'] = function()
                            vim.cmd('BufferOrderByDirectory')
                        end,
                        ['Language'] = function()
                            vim.cmd('BufferOrderByLanguage')
                        end,
                        ['Window Number'] = function()
                            vim.cmd('BufferOrderByWindowNumber')
                        end
                    })
                end,
                "Pick tabline sort mode"
            }
        }
    }
})
