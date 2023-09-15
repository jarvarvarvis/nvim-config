require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "vim",
        "lua",
        "rust",
        "python",
    },
    highlight = {
        enable = true
    }
}
