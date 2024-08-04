vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local wk = require('which-key')

require("neo-tree").setup {
    source_selector = {
        winbar = true,

        sources = {
            { source = "filesystem" },
            { source = "buffers" },
            { source = "git_status" },
        },
    },
    window = {
        mappings = {
            ['e'] = function() vim.cmd('Neotree focus filesystem') end,
            ['b'] = function() vim.cmd('Neotree focus buffers') end,
            ['g'] = function() vim.cmd('Neotree focus git_status') end,
        }
    }
}

wk.add({
    { "<space>t", group = "neo-tree" },
    { "<space>tt", function() vim.cmd('Neotree toggle') end, desc = "Toggle NeoTree" },
})
