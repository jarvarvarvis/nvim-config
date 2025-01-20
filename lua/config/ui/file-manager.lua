vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local wk = require("which-key")

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
            ["ff"] = function() vim.cmd("Neotree focus filesystem") end,
            ["bb"] = function() vim.cmd("Neotree focus buffers") end,
            ["gg"] = function() vim.cmd("Neotree focus git_status") end,
        }
    }
}

wk.add({
    { "<space>t", group = "neo-tree" },
    { "<space>tt", function() vim.cmd("Neotree toggle") end, desc = "Toggle NeoTree" },
})
