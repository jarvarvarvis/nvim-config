local wk = require("which-key")
local tabline_sort_picker = require("config.ui.tabline-sort-picker")

-- Register keybinds to control barbar
wk.add({
    { "<space>b",  group = "barbar" },
    { "<space>bc", function() vim.cmd("BufferClose") end, desc = "Close current buffer" },
    { "<space>bp", function() vim.cmd("BufferPick") end,  desc = "Pick buffer" },
    {
        "<space>bs",
        function()
            tabline_sort_picker.pick_tabline_sort_mode({
                ["Buffer Number"] = function()
                    vim.cmd("BufferOrderByBufferNumber")
                end,
                ["Directory"] = function()
                    vim.cmd("BufferOrderByDirectory")
                end,
                ["Language"] = function()
                    vim.cmd("BufferOrderByLanguage")
                end,
                ["Window Number"] = function()
                    vim.cmd("BufferOrderByWindowNumber")
                end
            })
        end,
        desc = "Pick tabline sort mode"
    }
})
