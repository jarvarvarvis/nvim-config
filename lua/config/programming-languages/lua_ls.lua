local M = {}

function M.setup(opts)
    local settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME }
            },
            telemetry = {
                enable = false,
            },
        }
    }

    require('lspconfig').lua_ls.setup({
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        settings = settings,
        flags = opts.flags
    })
end

return M
