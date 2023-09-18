local diaglist = require('diaglist')
local wk = require('which-key')
local telescope = require('telescope.builtin')

diaglist.init {}

-- See ':help vim.diagnostic.*' for documentation on any of the below functions
wk.register({
    -- <space>d is used as a prefix for diagnostics
    ["<space>d"] = {
        name = "+diagnostics",
        d = {
            diaglist.open_all_diagnostics,
            "Open diagnostics"
        },
        f = {
            function()
                telescope.diagnostics()
            end,
            "Find diagnostics"
        }
    },
    ["["] = {
        name = "+prev",
        d = {
            vim.diagnostic.goto_prev,
            "Previous diagnostic"
        }
    },
    ["]"] = {
        name = "+next",
        d = {
            vim.diagnostic.goto_next,
            "Next diagnostic"
        }
    }
})
