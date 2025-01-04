local M = {}

function M.setup(opts)
    require('lspconfig').vimls.setup(opts)
end

return M

