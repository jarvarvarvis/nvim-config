local M = {}

function M.setup(opts)
    local on_attach = opts.on_attach
    local capabilities = opts.capabilities
    local flags = opts.flags

    local tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = true
        },
        hover_actions = {
            auto_focus = true
        }
    }

    require('rust-tools').setup({
        tools = tools,
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = flags
        }
    })
end

return M
