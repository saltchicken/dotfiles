-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Horizontal split with a new terminal
vim.keymap.set("n", "-", "<Cmd>terminal<CR>", { desc = "Open terminal in horizontal split" })

-- Vertical split with a new terminal
vim.keymap.set("n", "|", "<Cmd>vertical terminal<CR>", { desc = "Open terminal in vertical split" })
