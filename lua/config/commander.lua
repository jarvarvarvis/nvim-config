require("commander").setup {
    components = {
        "DESC",
        "CAT",
        -- "KEYS",
        -- "CMD",
    },
    sort_by = {
        -- "DESC",
        "CAT",
        -- "KEYS",
        -- "CMD",
    },
    separator = " | ",
    auto_replace_desc_with_cmd = true,
    integration = {
        telescope = {
            enable = true,
            theme = require("telescope.themes").commander
        }
    }
}
