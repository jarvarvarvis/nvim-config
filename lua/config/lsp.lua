local wk = require('which-key')
local telescope = require('telescope.builtin')

-- Use an on_attach function to only map the following keys after the language
-- server attaches to the current buffer
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    -- Mappings
    -- See ':help vim.lsp.*' for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    wk.register({
        -- <space>d is used as a prefix for LSP diagnostic commands
        ["<space>d"] = {
            s = {
                function()
                    print(vim.inspect(vim.lsp.buf.server_ready()))
                end,
                "Check server status"
            }
        },
        -- <space>g is used as a prefix for LSP information commands
        ["<space>g"] = {
            name = "+goto",
            D = { vim.lsp.buf.declaration, "Goto declaration" },
            d = { telescope.lsp_definitions, "View definitions" },
            i = { telescope.lsp_implementations, "View implementations" },
            r = { telescope.lsp_references, "View references" },
            T = { telescope.lsp_type_definitions, "View type definitions" },
            K = { vim.lsp.buf.hover, "Toggle hover" },
            k = { vim.lsp.buf.signature_help, "Show signature help" },
        },
        -- <space>a is used as a prefix for code actions
        ["<space>a"] = {
            name = "+action",
            r = { vim.lsp.buf.rename, "Rename" },
            c = { vim.lsp.buf.code_action, "Code actions" },
            f = {
                function()
                    vim.lsp.buf.format { async = true }
                end,
                "Format file"
            }
        },
        -- <space>l is used as a prefix for the LSP code lens
        ["<space>l"] = {
            name = "+lens",
            d = { vim.lsp.codelens.refresh, "Refresh" },
            r = { vim.lsp.codelens.run, "Run" }
        }
    }, bufopts)
end

-- Configure borders
local borders = require('config.borders')

-- Configure border in floating previews (hover, signatureHelp)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or borders.border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Configure LspInfo border
require('lspconfig.ui.windows').default_options = {
    border = borders.border,
}

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



-- Setup lsp_signature plugin
require('lsp_signature').setup {
    bind = true,
    handler_opts = {
        border = borders.border
    }
}

-- Setup lsp-colors
require('lsp-colors').setup {
    Error = "#cc6666",
    Warning = "#f0c674",
    Information = "#81a2be",
    Hint = "#8abeb7",
}

-- Setup nvim-custom-diagnostic-highlight plugin
vim.cmd [[highlight UnusedHighlightGroup ctermfg=gray guifg=gray]]

require('nvim-custom-diagnostic-highlight').setup {
    register_handler = true,
    highlight_group = 'UnusedHighlightGroup',
    diagnostic_handler_namespace = 'unused_handler'
}

-- Setup nvim-lightbulb plugin
require('nvim-lightbulb').setup {
    sign = {
        enabled = true,
        priority = 10
    }
}

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]
