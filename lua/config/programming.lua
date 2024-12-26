-- Mason configuration
require('mason').setup {
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
}

-- Install required language servers
require('mason-lspconfig').setup {
    ensure_installed = {
        "pyright",
        "vimls",
        "clangd",
        "lua_ls",
        "rust_analyzer",
    }
}

-- Use an on_attach function to only map the keybinds after the language server
-- attaches to the current buffer
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    require('config.lsp-keymap').setup(bufnr)
end

-- Configure language servers
local lsp_setup_opts = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }
}

-- pyright language server
require('config.programming-languages.pyright').setup(lsp_setup_opts)

-- vimls language server
require('config.programming-languages.vimls').setup(lsp_setup_opts)

-- clangd language server
require('config.programming-languages.clangd').setup(lsp_setup_opts)

-- lua_ls language server
require('config.programming-languages.lua_ls').setup(lsp_setup_opts)

-- Rust (sets up rust-analyzer internally)
require('config.programming-languages.rust').setup({
    lsp_opts = lsp_setup_opts
})

-- C3 (sets up c3_lsp internally)
require('config.programming-languages.c3').setup({})

-- Set up LSP UI configuration
require('config.lsp-ui').setup()
