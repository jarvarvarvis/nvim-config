vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require('windows').setup {
    autowidth = {
        enable = true,
        minwidth = 10,
        filetype = { }
    },
    ignore = {
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree" }
    },
}


vim.keymap.set('n', '<C-w>z', function()
    vim.cmd('WindowsMaximize')
end)

vim.keymap.set('n', '<C-w>_', function()
    vim.cmd('WindowsMaximizeVertically')
end)

vim.keymap.set('n', '<C-w>|', function()
    vim.cmd('WindowsMaximizeHorizontally')
end)

vim.keymap.set('n', '<C-w>=', function()
    vim.cmd('WindowsEqualize')
end)
