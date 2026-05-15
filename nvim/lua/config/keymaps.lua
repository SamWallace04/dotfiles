-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- General
vim.keymap.set("n", "<C-c>", "<Esc>")

vim.keymap.set({ "n", "v" }, "gh", "_")
vim.keymap.set({ "n", "v" }, "gl", "$")

-- Center on cursor after going up/down half a page.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center on cursor when scrolling through results. (zv unfold)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clear the current search.
vim.keymap.set("n", "<F3>", function()
  vim.cmd("noh")
end)

-- Delete and paste without losing register.
vim.keymap.set("v", "<leader>p", '"_dP')
