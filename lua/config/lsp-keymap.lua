local wk = require('which-key')
local telescope = require('telescope.builtin')

local M = {}

function M.setup(bufnr)
    -- Mappings
    -- See ':help vim.lsp.*' for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    wk.add({
        -- <space>d is used as a prefix for LSP diagnostic commands
        { "<space>ds", function() print(vim.inspect(vim.lsp.buf.server_ready())) end, buffer = 3,       desc = "Check server status",   remap = false },

        -- <space>g is used as a prefix for LSP information commands
        { "<space>g",  buffer = 3,                                                    group = "goto",   remap = false },
        { "<space>gD", vim.lsp.buf.declaration,                                       buffer = 3,       desc = "Goto declaration",      remap = false },
        { "<space>gK", vim.lsp.buf.hover,                                             buffer = 3,       desc = "Toggle hover",          remap = false },
        { "<space>gT", telescope.lsp_type_definitions,                                buffer = 3,       desc = "View type definitions", remap = false },
        { "<space>gd", telescope.lsp_definitions,                                     buffer = 3,       desc = "View definitions",      remap = false },
        { "<space>gi", telescope.lsp_implementations,                                 buffer = 3,       desc = "View implementations",  remap = false },
        { "<space>gr", telescope.lsp_references,                                      buffer = 3,       desc = "View references",       remap = false },
        { "<space>gk", vim.lsp.buf.signature_help,                                    buffer = 3,       desc = "Show signature help",   remap = false },

        -- <space>l is used as a prefix for the LSP code lens
        { "<space>l",  buffer = 3,                                                    group = "lens",   remap = false },
        { "<space>ld", vim.lsp.codelens.refresh,                                      buffer = 3,       desc = "Refresh",               remap = false },
        { "<space>lr", vim.lsp.codelens.run,                                          buffer = 3,       desc = "Run",                   remap = false },

        -- <space>a is used as a prefix for code actions
        { "<space>a",  buffer = 3,                                                    group = "action", remap = false },
        { "<space>ac", vim.lsp.buf.code_action,                                       buffer = 3,       desc = "Code actions",          remap = false },
        { "<space>af", function() vim.lsp.buf.format { async = true } end,            buffer = 3,       desc = "Format file",           remap = false },
        { "<space>ar", vim.lsp.buf.rename,                                            buffer = 3,       desc = "Rename",                remap = false },
    }, bufopts)
end

return M
