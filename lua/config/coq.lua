vim.g.coq_settings = {
    auto_start = 'shut-up',
    clients = {
        tree_sitter = {
            enabled = false
        },
        paths = { preview_lines = 3 }
    },
    display = {
        pum = {
            fast_close = false,
        }
    },
    completion = {
        smart = true
    },
    keymap = {
        recommended = true,
        manual_complete = "<c-space>",
        bigger_preview = "<c-k>"
    }
}

---@diagnostic disable: unused-local
local coq = require('coq')
