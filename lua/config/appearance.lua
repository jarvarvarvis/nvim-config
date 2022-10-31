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
-- vim.cmd('colorscheme base16-tomorrow-night')
require('base16-colorscheme').setup({
    base00 = '#1d1f21',
    base01 = '#282a2e',
    base02 = '#373b41',
    base03 = '#969896',
    base04 = '#b4b7b4',
    base05 = '#c5c8c6',
    base06 = '#e0e0e0',
    base07 = '#ffffff',
    base08 = '#cc6666',
    base09 = '#de935f',
    base0A = '#f0c674',
    base0B = '#b5bd68',
    base0C = '#8abeb7',
    base0D = '#81a2be',
    base0E = '#b294bb',
    base0F = '#a3685a',
})


-- Setup hexokinase
vim.g.Hexokinase_highlighters = {'backgroundfull'}

-- Setup dressing.nvim
require('dressing').setup {
    input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        anchor = "SW",
        border = "rounded",
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
        -- Disable illuminate in NvimTree window
        'NvimTree',

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
