local borders = require("config.borders")

require('which-key').setup {
    window = {
        border = borders.border
    }
}
