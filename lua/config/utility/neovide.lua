-- Set font
vim.o.guifont = "Iosevka Nerd Font Mono:11"

-- Transparency
vim.g.transparency = 1.0
vim.g.neovide_transparency = 1.0

-- Disable shadows
vim.g.neovide_floating_shadow = false

-- Decrease underline stroke scale
vim.g.neovide_underline_stroke_scale = 0.5

-- Scrolling
vim.g.neovide_scroll_animation_length = 0.1

-- Dynamically change the scale factor
vim.g.neovide_scale_factor = 0.8
local opts = { silent = true }

vim.api.nvim_set_keymap("n", "<C-*>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-_>",
    ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-0>",
    ":lua vim.g.neovide_scale_factor = 0.8<CR>", opts)
