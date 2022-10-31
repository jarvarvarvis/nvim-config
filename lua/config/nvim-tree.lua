vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local wk = require('which-key')
local command_center = require('command_center')

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
        t = { name = "+nvim-tree" }
    }
})

command_center.add({
    {
        desc = "Toggle NvimTree",
        category = "nvim-tree",
        cmd = function() vim.cmd('NvimTreeToggle') end,
        keys = { "n", "<space>tt", noremap }
    },
    {
        desc = "Focus NvimTree",
        category = "nvim-tree",
        cmd = function() vim.cmd('NvimTreeFocus') end,
        keys = { "n", "<space>tf", noremap }
    }
})
