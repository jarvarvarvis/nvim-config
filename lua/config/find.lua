local wk = require('which-key')
local builtin = require('telescope.builtin')

wk.add({
    { "<space>f",  group = "find" },
    { "<space>fb", builtin.find_files, desc = "Find buffers" },
    { "<space>ff", builtin.buffers,    desc = "Find files" },
    { "<space>fg", builtin.oldfiles,   desc = "Live Grep" },
    { "<space>fr", builtin.live_grep,  desc = "Recent files" },
})
