local wk = require('which-key')
local telescope = require('telescope.builtin')

local borders = require("config.borders")

require('telescope').setup {
    defaults = {
        borderchars = borders.border_character_table
    }
}

wk.register({
    ["<space>"] = {
        -- Spelling
        a = {
            name = "+action",
            s = {
                telescope.spell_suggest,
                "Spelling suggestions"
            }
        }
    }
})
