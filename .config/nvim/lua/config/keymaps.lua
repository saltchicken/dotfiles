-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Horizontal split with a new terminal
vim.keymap.set("n", "-", "<Cmd>terminal<CR>", { desc = "Open terminal in horizontal split" })

-- Vertical split with a new terminal
vim.keymap.set("n", "|", "<Cmd>vertical terminal<CR>", { desc = "Open terminal in vertical split" })

-- Normal mode
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- Insert mode
vim.keymap.set("i", "<C-h>", "<C-o><C-w>h", { desc = "Move to left window", silent = true })
vim.keymap.set("i", "<C-j>", "<C-o><C-w>j", { desc = "Move to lower window", silent = true })
vim.keymap.set("i", "<C-k>", "<C-o><C-w>k", { desc = "Move to upper window", silent = true })
vim.keymap.set("i", "<C-l>", "<C-o><C-w>l", { desc = "Move to right window", silent = true })

-- Terminal mode (with fix for shell conflicts)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window", silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to lower window", silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to upper window", silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window", silent = true })
