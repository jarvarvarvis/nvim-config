-- Setup mini-surround
-- mini-surround keybinds work like this:
-- * <keybind> + <pair> => insert <pair> according to action in keymap
-- * <keybind> + i      => read left and right delimiter and insert <pair>
--                         according to action in keymap
require('nvim-surround').setup {
    keymaps = {
        ---- Pair insertion
        -- Normal mode
        --normal = "",
        normal_cur = "ssi",
        --normal_line = "",
        normal_cur_line = "SSi",

        -- Visual mode
        visual = "ssi",
        visual_line = "SSi",

        ---- Pair deletion
        delete = "sd",

        ---- Pair changing
        change = "sc",
    }
}
