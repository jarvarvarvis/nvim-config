local wk = require("which-key")
local telescope = require("telescope.builtin")

local M = {}

function M.setup(bufnr)
    -- Mappings
    -- See ":help vim.lsp.*" for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    wk.add({
        -- <space>d is used as a prefix for LSP diagnostic commands
        { "<space>ds", function() print(vim.inspect(vim.lsp.buf.server_ready())) end, desc = "Check server status",   remap = false },

        -- <space>g is used as a prefix for LSP information commands
        { "<space>g",  group = "goto",                                                remap = false },
        { "<space>gD", vim.lsp.buf.declaration,                                       desc = "Goto declaration",      remap = false },
        { "<space>gK", vim.lsp.buf.hover,                                             desc = "Toggle hover",          remap = false },
        { "<space>gT", telescope.lsp_type_definitions,                                desc = "View type definitions", remap = false },
        { "<space>gd", telescope.lsp_definitions,                                     desc = "View definitions",      remap = false },
        { "<space>gi", telescope.lsp_implementations,                                 desc = "View implementations",  remap = false },
        { "<space>gr", telescope.lsp_references,                                      desc = "View references",       remap = false },
        { "<space>gk", vim.lsp.buf.signature_help,                                    desc = "Show signature help",   remap = false },

        -- <space>l is used as a prefix for the LSP code lens
        { "<space>l",  group = "lens",                                                remap = false },
        { "<space>ld", vim.lsp.codelens.refresh,                                      desc = "Refresh",               remap = false },
        { "<space>lr", vim.lsp.codelens.run,                                          desc = "Run",                   remap = false },

        -- <space>a is used as a prefix for code actions
        { "<space>a",  group = "action",                                              remap = false },
        { "<space>ac", vim.lsp.buf.code_action,                                       desc = "Code actions",          remap = false },
        { "<space>af", function() vim.lsp.buf.format { async = true } end,            desc = "Format file",           remap = false },
        { "<space>ar", vim.lsp.buf.rename,                                            desc = "Rename",                remap = false },
    }, bufopts)
end

return M
