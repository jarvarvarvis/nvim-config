local ls = require("luasnip")

-- Jumping
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

-- Expand (not sure what that means yet?)
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })

-- Change active choice (not sure what that means yet?)
vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
