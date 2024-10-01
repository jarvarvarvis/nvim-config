require('mason').setup {
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
}

require('mason-lspconfig').setup {
    ensure_installed = {
        "pyright",
        "vimls",
        "clangd",
        "lua_ls",
        "rust_analyzer",
        "zls"
    }
}
