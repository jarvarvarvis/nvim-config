local wk = require('which-key')

-- Register <space>c keybind to open the commander
wk.register({
    ["<space>"] = {
        name = "+command",
        c = {
            function()
                vim.cmd('Telescope commander')
            end,
            "Command Center"
        }
    }
})
