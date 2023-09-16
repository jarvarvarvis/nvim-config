-- Set font
vim.cmd [[set guifont=DroidSansMono\ Nerd\ Font\ Mono:h11]]

-- Transparency
vim.g.transparency = 1.0
vim.g.neovide_transparency = 1.0

-- Scrolling
vim.g.neovide_scroll_animation_length = 0.2

-- Dynamically changing the scale factor
local default_scale_factor = 1.0
vim.g.neovide_scale_factor = default_scale_factor

local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-*>", function()
    change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-_>", function()
    change_scale_factor(1 / 1.25)
end)
vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = default_scale_factor
end)
