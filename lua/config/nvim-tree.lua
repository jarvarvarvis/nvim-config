vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local wk = require('which-key')
local commander = require('commander')

local noremap = { noremap = true }

require("nvim-tree").setup {
    git = {
        ignore = false,
    },
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true
    },
    filters = {
        -- Hide the .git folder
        custom = { "^.git$" }
    }
}

wk.register({
    ["<space>"] = {
        t = {
            name = "+nvim-tree",
            t = { "Toggle NvimTree" },
            f = { "Focus NvimTree" },
        }
    }
})

commander.add({
    {
        desc = "Toggle NvimTree",
        cat = "nvim-tree",
        cmd = function() vim.cmd('NvimTreeToggle') end,
        keys = { "n", "<space>tt", noremap }
    },
    {
        desc = "Focus NvimTree",
        cat = "nvim-tree",
        cmd = function() vim.cmd('NvimTreeFocus') end,
        keys = { "n", "<space>tf", noremap }
    }
})
