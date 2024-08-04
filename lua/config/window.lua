-- Configure windows.nvim
vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require('windows').setup {
    autowidth = {
        enable = true,
        minwidth = 10,
        filetype = {}
    },
    ignore = {
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree" }
    },
}

local wk = require('which-key')

wk.add({

    { "<C-w>=", function() vim.cmd('WindowsMaximize') end,             desc = "Equalize windows" },
    { "<C-w>_", function() vim.cmd('WindowsMaximizeVertically') end,   desc = "Maximize window vertically" },
    { "<C-w>z", function() vim.cmd('WindowsMaximizeHorizontally') end, desc = "Maximize window" },
    { "<C-w>|", function() vim.cmd('WindowsEqualize') end,             desc = "Maximize window horizontally" },
})

-- Configure nvim-window-picker
local window_picker = require('window-picker')

window_picker.setup {
    -- type of hints you want to get
    -- following types are supported
    -- 'statusline-winbar' | 'floating-big-letter'
    -- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
    -- 'floating-big-letter' draw big letter on a floating window
    -- used
    hint = 'floating-big-letter',

    -- when you go to window selection mode, status bar will show one of
    -- following letters on them so you can use that letter to select the window
    selection_chars = 'ZUIOHJKLBNM;',

    -- This section contains picker specific configurations
    picker_config = {
        statusline_winbar_picker = {
            -- You can change the display string in status bar.
            -- It supports '%' printf style. Such as `return char .. ': %f'` to display
            -- buffer file path. See :h 'stl' for details.
            selection_display = function(char, _)
                return '%=' .. char .. '%='
            end,

            -- whether you want to use winbar instead of the statusline
            -- "always" means to always use winbar,
            -- "never" means to never use winbar
            -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
            use_winbar = 'smart', -- "always" | "never" | "smart"
        },

        floating_big_letter = {
            -- window picker plugin provides bunch of big letter fonts
            -- fonts will be lazy loaded as they are being requested
            -- additionally, user can pass in a table of fonts in to font
            -- property to use instead

            font = require('config.window-picker-font'),
        },
    },

    -- whether to show 'Pick window:' prompt
    show_prompt = true,

    -- prompt message to show to get the user input
    prompt_message = 'Pick window: ',

    -- if you want to manually filter out the windows, pass in a function that
    -- takes two parameters. You should return window ids that should be
    -- included in the selection
    -- EX:-
    -- function(window_ids, filters)
    --    -- folder the window_ids
    --    -- return only the ones you want to include
    --    return {1000, 1001}
    -- end
    filter_func = nil,

    -- following filters are only applied when you are using the default filter
    -- defined by this plugin. If you pass in a function to "filter_func"
    -- property, you are on your own
    filter_rules = {
        -- when there is only one window available to pick from, use that window
        -- without prompting the user to select
        autoselect_one = true,

        -- whether you want to include the window you are currently on to window
        -- selection or not
        include_current_win = false,

        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'notify' },

            -- if the file type is one of following, the window will be ignored
            buftype = { 'terminal' },
        },

        -- filter using window options
        wo = {},

        -- if the file path contains one of following names, the window
        -- will be ignored
        file_path_contains = {},

        -- if the file name contains one of following names, the window will be
        -- ignored
        file_name_contains = {},
    },

    -- You can pass in the highlight name or a table of content to set as
    -- highlight
    highlights = {
        statusline = {
            focused = {
                fg = '#ededed',
                bg = '#e35e4f',
                bold = true,
            },
            unfocused = {
                fg = '#ededed',
                bg = '#44cc41',
                bold = true,
            },
        },
        winbar = {
            focused = {
                fg = '#ededed',
                bg = '#e35e4f',
                bold = true,
            },
            unfocused = {
                fg = '#ededed',
                bg = '#44cc41',
                bold = true,
            },
        },
    },
}

-- Pick a window
wk.add({
    {
        "<C-w>p",
        function()
            local picked_window_id = window_picker.pick_window()
            if picked_window_id ~= nil then
                print("Jumping to window " .. picked_window_id)
                vim.api.nvim_set_current_win(picked_window_id)
            end
        end,
        desc = "Pick window"
    },
})
