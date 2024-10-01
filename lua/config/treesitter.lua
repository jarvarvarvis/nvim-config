require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "markdown",
        "markdown_inline",
        "glsl",
        "vim",
        "lua",
        "rust",
        "python",
        "zig"
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
