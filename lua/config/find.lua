local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

wk.add({
    { "<space>f",  group = "find" },
    { "<space>fb", telescope_builtin.buffers,    desc = "Find buffers" },
    { "<space>ff", telescope_builtin.find_files, desc = "Find files" },
    { "<space>fg", telescope_builtin.live_grep,  desc = "Live Grep" },
    { "<space>fr", telescope_builtin.oldfiles,   desc = "Recent files" },
})
