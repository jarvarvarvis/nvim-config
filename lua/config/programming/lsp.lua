-- Mason configuration
require("mason").setup {
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
}

-- Install required language servers
require("mason-lspconfig").setup {
    ensure_installed = {
        "clangd",
        "lua_ls",
        "rust_analyzer",
    }
}

-- Use an on_attach function to only map the keybinds after the language server
-- attaches to the current buffer
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    require("config.programming.lsp-keymap").setup(bufnr)
end

-- Configure language servers
local lsp_setup_opts = {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }
}

require("config.programming.language-servers.clangd").setup(lsp_setup_opts)
require("config.programming.language-servers.lua_ls").setup(lsp_setup_opts)
require("config.programming.language-servers.rust").setup({ lsp_opts = lsp_setup_opts })

-- Set up LSP UI configuration
require("config.programming.lsp-ui").setup()
