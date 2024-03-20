local M = {}

function M.setup(opts)
    local tools = {
        hover_actions = {
            auto_focus = true
        }
    }

    require('rust-tools').setup({
        tools = tools,
        server = opts
    })
end

return M
