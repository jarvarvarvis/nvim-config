local M = {}

function M.setup(opts)
    -- Add c3 filetype
    vim.filetype.add({
        extension = {
            c3 = "c3",
            c3i = "c3",
            c3t = "c3",
        },
    });

    -- Register treesitter install info
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.c3 = {
        install_info = {
            url = 'https://github.com/c3lang/tree-sitter-c3',
            files = { 'src/parser.c', 'src/scanner.c' },
            branch = 'main',
        },
        sync_install = false, -- Set to true if you want to install synchronously
        auto_install = true,  -- Automatically install when opening a file
        filetype = 'c3',      -- if filetype does not match the parser name
    }
end

return M
