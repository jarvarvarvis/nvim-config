-- Setup nvim-autopairs with coq_nvim compatibility
local autopairs = require("nvim-autopairs")

autopairs.setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim" },
    map_bs = false,
    map_cr = false
})

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
local remap_args = { expr = true, noremap = true }
vim.api.nvim_set_keymap(
    "i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], remap_args
)
vim.api.nvim_set_keymap(
    "i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], remap_args
)
vim.api.nvim_set_keymap(
    "i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], remap_args
)
vim.api.nvim_set_keymap(
    "i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], remap_args
)

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ "selected" }).selected ~= -1 then
            return autopairs.esc("<c-y>")
        else
            return autopairs.esc("<c-e>") .. autopairs.autopairs_cr()
        end
    else
        return autopairs.autopairs_cr()
    end
end
vim.api.nvim_set_keymap("i", "<cr>", "v:lua.MUtils.CR()", remap_args)

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
        return autopairs.esc("<c-e>") .. autopairs.autopairs_bs()
    else
        return autopairs.autopairs_bs()
    end
end
vim.api.nvim_set_keymap("i", "<bs>", "v:lua.MUtils.BS()", remap_args)

-- Function to strip trailing whitespace
vim.api.nvim_create_user_command("StripTrailingWhitespace", [[%s/\s\+$//e]], {})

vim.keymap.set("n", "<M-n>", function()
    vim.cmd("noh")
end)
