local telescope = require('telescope')
local command_center = require('command_center')
local wk = require('which-key')

-- Register <space>c keybind to open the command_center
wk.register({
    ["<space>"] = {
        name = "+command",
        c = {
            function()
                vim.cmd('Telescope command_center')
            end,
            "Command Center"
        }
    }
})

-- Setup and load telescope extensions
telescope.setup {
    extensions = {
        command_center = {
            components = {
                command_center.component.DESC,
                command_center.component.CATEGORY,
                -- command_center.component.KEYS,
            },
            sort_by = {
                command_center.component.DESC,
                -- command_center.component.CATEGORY,
                -- command_center.component.KEYS,
            },
            separator = "  |  ",
            auto_replace_desc_with_cmd = false,
        }
    }
}

telescope.load_extension('command_center')
