local wk = require('which-key')
local builtin = require('telescope.builtin')
local commander = require('commander')

local noremap = { noremap = true }

wk.register({
    ["<space>"] = {
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
        keys = { "n", "<space>ff", noremap }
    },
    {
        desc = "Find buffers",
        cat = "find",
        cmd = builtin.buffers,
        keys = { "n", "<space>fb", noremap }
    },
    {
        desc = "Recent files",
        cat = "find",
        cmd = builtin.oldfiles,
        keys = { "n", "<space>fr", noremap }
    },
    {
        desc = "Live Grep",
        cat = "find",
        cmd = builtin.live_grep,
        keys = { "n", "<space>fg", noremap }
    }
})
