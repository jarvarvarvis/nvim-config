local diaglist = require('diaglist')
local wk = require('which-key')
local telescope = require('telescope.builtin')

diaglist.init {}

-- See ':help vim.diagnostic.*' for documentation on any of the below functions
wk.add({
    -- <space>d is used as a prefix for diagnostics
    { "<space>d",  group = "diagnostics" },
    { "<space>dd", diaglist.open_all_diagnostics,          desc = "Open diagnostics" },
    { "<space>df", function() telescope.diagnostics() end, desc = "Find diagnostics" },
    { "<space>dh", vim.diagnostic.open_float,              desc = "Show diagnostics in a floating window" },
    { "[",         group = "prev" },
    { "[d",        vim.diagnostic.goto_prev,               desc = "Previous diagnostic" },
    { "]",         group = "next" },
    { "]d",        vim.diagnostic.goto_next,               desc = "Next diagnostic" },
})
