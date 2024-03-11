local M = {}

function M.setup(opts)
    local on_attach = opts.on_attach
    local capabilities = opts.capabilities
    local flags = opts.flags

    local settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        }
    }

    require('lspconfig').lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings,
        flags = flags
    })
end

return M
