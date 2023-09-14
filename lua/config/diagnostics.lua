local diaglist = require('diaglist')
local commander = require('commander')
local wk = require('which-key')
local telescope = require('telescope.builtin')

local noremap = { noremap = true }
local opts = { noremap = true, silent = true }

diaglist.init {}

-- See ':help vim.diagnostic.*' for documentation on any of the below functions
wk.register({
    -- <space>d is used as a prefix for diagnostics
    ["<space>d"] = {
        name = "+diagnostics",
        d = { "Open diagnostics" },
        f = { "Find diagnostics" }
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
}, opts)

-- Setup command
commander.add({
    {
        desc = "Open diagnostics",
        cat = "diagnostics",
        cmd = diaglist.open_all_diagnostics,
        keys = { "n", "<space>dd", noremap }
    },
    {
        desc = "Find diagnostics",
        cat = "diagnostics",
        cmd = function()
            telescope.diagnostics()
        end,
        keys = { "n", "<space>df", noremap }
    }
})
