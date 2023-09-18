vim.g.coq_settings = {
    auto_start = 'shut-up',
    clients = {
        tree_sitter = {
            enabled = true
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
        recommended = false,
    }
}
