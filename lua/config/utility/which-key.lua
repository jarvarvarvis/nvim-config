local borders = require("config.utility.borders")

require("which-key").setup {
    win = {
        border = borders.table_clockwise_from_top_left
    }
}
