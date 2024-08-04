local wk = require('which-key')
local telescope = require('telescope.builtin')

local borders = require("config.borders")

require('telescope').setup {
    defaults = {
        borderchars = borders.border_character_table
    }
}

wk.add({
    { "<space>a",  group = "action" },
    { "<space>as", telescope.spell_suggest, desc = "Spelling suggestions" },
})
