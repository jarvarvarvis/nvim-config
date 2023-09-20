local borders = require("config.borders")
local wk = require('which-key')

require('gitsigns').setup {
    -- Configure signs
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    _signs_staged_enable = true, -- Enable the staged signs feature

    sign_priority = 6,

    -- Set toggles
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

    -- Configure current line blame
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',

    -- Configure preview
    preview_config = {
        -- Options passed to nvim_open_win
        border = borders.border,
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },

    -- Configure how gitsigns update/editor behaviour and limits
    watch_gitdir = {
        follow_files = true
    },
    attach_to_untracked = true,
    update_debounce = 100,
    status_formatter = nil,  -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)

    -- Configure additional integrations
    yadm = {
        enable = false
    },
}

wk.register({
    ["<space>G"] = {
        name = "+gitsigns",

        s = {
            function()
                vim.cmd("Gitsigns stage_hunk")
            end,
            "Stage hunk",
        },
        r = {
            function()
                vim.cmd("Gitsigns reset_hunk")
            end,
            "Reset hunk",
        },
        u = {
            function()
                vim.cmd("Gitsigns undo_stage_hunk")
            end,
            "Undo stage hunk",
        },

        S = {
            function()
                vim.cmd("Gitsigns stage_buffer")
            end,
            "Stage buffer",
        },
        R = {
            function()
                vim.cmd("Gitsigns reset_buffer")
            end,
            "Reset buffer",
        },
        U = {
            function()
                vim.cmd("Gitsigns reset_buffer_index")
            end,
            "Undo stage buffer",
        },

        G = {
            function()
                vim.cmd("Git")
            end,
            "Vim fugitive"
        },
        l = {
            function()
                vim.cmd("Git log --decorate")
            end,
            "Show git log"
        }
    }
})
