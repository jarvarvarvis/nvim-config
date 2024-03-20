local wk = require('which-key')
local telescope = require('telescope.builtin')

local M = {}

function M.setup(bufnr)
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

return M
