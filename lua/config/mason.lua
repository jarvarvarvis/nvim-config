require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "pyright",
        "vimls",
        "clangd",
        "lua_ls",
        "rust_analyzer",
    }
}
