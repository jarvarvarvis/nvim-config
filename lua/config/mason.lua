require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "pyright",
        "lua_ls",
        "vimls",
        "clangd",
        "rust_analyzer"
    }
}
