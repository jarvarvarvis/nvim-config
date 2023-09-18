-- Configure nvim-base16 to not manage telescope
-- This fixes some issues with telescopes borders and rounded corners
require('base16-colorscheme').with_config({
    telescope = false,
    indentblankline = true,
    notify = true,
    ts_rainbow = true,
    cmp = true,
    illuminate = true,
})

-- Load colorscheme
vim.cmd('colorscheme base16-catppuccin')

-- Setup hexokinase
vim.g.Hexokinase_highlighters = {'backgroundfull'}

local borders = require('config.borders')

-- Setup dressing.nvim
require('dressing').setup {
    input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        border = borders.border,
        relative = "cursor",
    },
    select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { "telescope", "builtin" },

        -- Don't trim trailing ':' from prompt
        trim_prompt = false
    }
}

-- Setup lsp-colors
require('lsp-colors').setup {
    Error = "#cc6666",
    Warning = "#f0c674",
    Information = "#81a2be",
    Hint = "#8abeb7",
}

-- Setup illuminate
require('illuminate').configure {
    providers = { 'lsp', 'treesitter', 'regex' },

    delay = 100,

    filetypes_overrides = {},
    filetypes_denylist = {
        -- Disable illuminate in neo-tree window
        'neo-tree',

        -- Disable illuminate in Telescope prompt windows
        'TelescopePrompt',

        -- Disable illuminate in quickfix list
        'qf',

        -- Disable illuminate in Dressing prompt windows
        'DressingPrompt',

        -- Disable illuminate in windows that don't specify a filetype
        '',
    },

    modes_denylist = {},

    under_cursor = true
}

vim.cmd[[hi def IlluminatedWordText gui=underline]]
