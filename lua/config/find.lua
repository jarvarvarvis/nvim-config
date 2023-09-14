local wk = require('which-key')
local builtin = require('telescope.builtin')
local command_center = require('command_center')

local noremap = { noremap = true }

wk.register({
    -- <leader> is the \ key
    ["<leader>"] = {
        f = {
            name = "+find"
        }
    },
})

command_center.add({
    {
        desc = "Find files",
        category = "find",
        cmd = builtin.find_files,
        keys = { "n", "<leader>ff", noremap }
    },
    {
        desc = "Find buffers",
        category = "find",
        cmd = builtin.buffers,
        keys = { "n", "<leader>fb", noremap }
    },
    {
        desc = "Recent files",
        category = "find",
        cmd = builtin.oldfiles,
        keys = { "n", "<leader>fr", noremap }
    },
    {
        desc = "Live Grep",
        category = "find",
        cmd = builtin.live_grep,
        keys = { "n", "<leader>fg", noremap }
    }
}, command_center.REGISTER_ONLY)
