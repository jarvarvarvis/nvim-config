local M = {}

function M.setup(opts)
    require('lspconfig').zls.setup(opts)
end

return M


