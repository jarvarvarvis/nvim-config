require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "markdown",
        "markdown_inline",
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
