local telescope = require('telescope.builtin')

require('lualine').setup {
    options = {
        theme = "base16",
        disabled_filetypes = {
            'neo-tree'
        },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },

        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },

        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' }

        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },

        -- component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },

        component_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = {
            {
                'diagnostics',
                ---@diagnostic disable-next-line: unused-local
                on_click = function(opts)
                    telescope.diagnostics()
                end
            }
        },

        lualine_x = { 'branch', 'diff' },
        lualine_y = { 'filetype', 'encoding', 'fileformat' },
        lualine_z = { 'progress', 'location' },
    }
}

