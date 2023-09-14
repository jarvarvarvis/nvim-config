local wk = require('which-key')
local builtin = require('telescope.builtin')
local commander = require('commander')

local noremap = { noremap = true }

wk.register({
    -- <leader> is the \ key
    ["<leader>"] = {
        f = {
            name = "+find",
            f = { "Find files" },
            b = { "Find buffers" },
            r = { "Recent files" },
            g = { "Live Grep" },
        }
    },
})

commander.add({
    {
        desc = "Find files",
        cat = "find",
        cmd = builtin.find_files,
        keys = { "n", "<leader>ff", noremap }
    },
    {
        desc = "Find buffers",
        cat = "find",
        cmd = builtin.buffers,
        keys = { "n", "<leader>fb", noremap }
    },
    {
        desc = "Recent files",
        cat = "find",
        cmd = builtin.oldfiles,
        keys = { "n", "<leader>fr", noremap }
    },
    {
        desc = "Live Grep",
        cat = "find",
        cmd = builtin.live_grep,
        keys = { "n", "<leader>fg", noremap }
    }
})
