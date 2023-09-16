local wk = require('which-key')
local telescope = require('telescope.builtin')

local borders = require("config.borders")

require('telescope').setup {
    defaults = {
        borderchars = borders.border_character_table
    }
}

-- Register <space>c keybind to open the commander
wk.register({
    ["<space>"] = {
        name = "+command",
        c = {
            function()
                vim.cmd('Telescope commander')
            end,
            "Command Center"
        },

        -- Spelling
        a = {
            name = "+action",
            s = { telescope.spell_suggest, "Spelling suggestions" }
        }
    }
})
