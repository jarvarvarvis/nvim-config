require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "glsl",
        "vim",
        "lua",
        "rust",
        "python",
    },
    highlight = {
        enable = true
    }
}
