local diaglist = require('diaglist')
local command_center = require('command_center')
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
    },
    ["["] = {
        name = "+prev",
        d = { vim.diagnostic.goto_prev, "Previous diagnostic" }
    },
    ["]"] = {
        name = "+next",
        d = { vim.diagnostic.goto_next, "Next diagnostic" }
    }
}, opts)

-- Setup command
command_center.add({
    {
        desc = "Open diagnostics",
        category = "diagnostics",
        cmd = diaglist.open_all_diagnostics,
        keys = { "n", "<space>dd", noremap }
    },
    {
        desc = "Open buffer diagnostics",
        category = "diagnostics",
        cmd = diaglist.open_buffer_diagnostics,
        keys = { "n", "<space>db", noremap }
    },
    {
        desc = "Find diagnostics",
        category = "diagnostics",
        cmd = function()
            telescope.diagnostics()
        end,
        keys = { "n", "<space>df", noremap }
    }
}, command_center.REGISTER_ONLY)
