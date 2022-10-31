require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "pyright",
        "sumneko_lua",
        "vimls",
        "clangd",
        "rust_analyzer"
    }
}
