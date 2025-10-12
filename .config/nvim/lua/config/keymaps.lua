-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Horizontal split with a new terminal
-- vim.keymap.set("n", "-", "<Cmd>split<CR>", { desc = "Split window horizontally" })
--
-- -- Vertical split with a new terminal
-- vim.keymap.set("n", "|", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })

-- -- Normal mode
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })
--
-- -- Insert mode
-- vim.keymap.set("i", "<C-h>", "<C-o><C-w>h", { desc = "Move to left window", silent = true })
-- vim.keymap.set("i", "<C-j>", "<C-o><C-w>j", { desc = "Move to lower window", silent = true })
-- vim.keymap.set("i", "<C-k>", "<C-o><C-w>k", { desc = "Move to upper window", silent = true })
-- vim.keymap.set("i", "<C-l>", "<C-o><C-w>l", { desc = "Move to right window", silent = true })
--
-- -- Terminal mode (with fix for shell conflicts)
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window", silent = true })
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to lower window", silent = true })
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to upper window", silent = true })
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window", silent = true })

vim.keymap.set("n", "<leader>hp", function()
  Snacks.dashboard()
end, { desc = "Show Dashboard" })

vim.keymap.set("i", "<C-e>", require("neocodeium").accept)
vim.keymap.set("i", "<C-f>", require("neocodeium").accept_line)
vim.keymap.set("i", "<C-Right>", require("neocodeium").accept_word)
vim.keymap.set("i", "<C-Left>", require("neocodeium").clear)
vim.keymap.set("i", "<C-Down>", function()
  require("neocodeium").cycle_or_complete()
end)
vim.keymap.set("i", "<C-Up>", function()
  require("neocodeium").cycle_or_complete(-1)
end)

vim.keymap.set("n", "<leader>cp", function()
  vim.cmd("CodeContext")
end, { desc = "Copy CodeContext", noremap = true, silent = true })

vim.keymap.set("n", "<leader>ct", function()
  vim.cmd("CodeContext --tree")
end, { desc = "Show CodeContext tree", noremap = true, silent = true })

vim.keymap.set("n", "<leader>cs", function()
  vim.cmd("CodeContextFloat")
end, { desc = "Show CodeContext tree", noremap = true, silent = true })
