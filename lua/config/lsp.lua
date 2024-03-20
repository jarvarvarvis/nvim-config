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
require('config.language-servers.pyright').setup(lsp_setup_opts)

-- vimls language server
require('config.language-servers.vimls').setup(lsp_setup_opts)

-- clangd language server
require('config.language-servers.clangd').setup(lsp_setup_opts)

-- lua_ls language server
require('config.language-servers.lua_ls').setup(lsp_setup_opts)

-- Wrapper for rust-tools (sets up rust-analyzer internally)
require('config.language-servers.rust').setup(lsp_setup_opts)

-- Set up LSP UI configuration
require('config.lsp-ui').setup()
