local M = {}

function M.setup(opts)
    require('lspconfig').clangd.setup(opts)
end

return M
