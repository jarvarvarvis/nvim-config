local M = {}

function M.setup(opts)
    require('lspconfig').pyright.setup(opts)
end

return M
