local borders = require("config.borders")

require('which-key').setup {
    win = {
        border = borders.border
    }
}
