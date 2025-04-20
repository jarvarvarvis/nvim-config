-- Add c3 filetype
vim.filetype.add({
    extension = {
        c3 = "c3",
        c3i = "c3",
        c3t = "c3",
    },
});

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- Register C3 treesitter install info
parser_config.c3 = {
    install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
    },
    sync_install = false,
    auto_install = true,
    filetype = "c3",
}

-- Set up treesitter and install required grammars
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "json",
        "json5",
        "markdown",
        "markdown_inline",
        "glsl",
        "vim",
        "lua",
        "rust",
        "python",
        "c3",
        "latex",
        "typst",
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
