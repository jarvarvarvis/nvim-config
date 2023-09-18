local wk = require('which-key')
local builtin = require('telescope.builtin')

wk.register({
    ["<space>"] = {
        f = {
            name = "+find",
            f = {
                builtin.find_files,
                "Find files"
            },
            b = {
                builtin.buffers,
                "Find buffers"
            },
            r = {
                builtin.oldfiles,
                "Recent files"
            },
            g = {
                builtin.live_grep,
                "Live Grep"
            },
        }
    },
})
