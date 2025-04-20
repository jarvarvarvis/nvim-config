local M = {}

function M.setup(opts)
    local settings = {
        formatterMode = "typstyle",
        exportPdf = "never"
    }

    require("lspconfig").tinymist.setup {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        settings = settings,
        flags = opts.flags
    }
end

return M
