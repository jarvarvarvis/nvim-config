-- Set up neovide if we are running inside neovide
if vim.g.neovide then
    require("config.utility.neovide")
end

-- Set up which-key
require("config.utility.which-key")

-- Set up text utility plugins/keybinds
require("config.utility.text")

-- Set up version control config
require("config.utility.version-control")

-- Set up discord rich presence
require("config.utility.discord-rich-presence")
