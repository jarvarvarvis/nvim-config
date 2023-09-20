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
