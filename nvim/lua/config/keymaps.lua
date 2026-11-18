vim.keymap.set("i", "<M-u>", "<C-v>", { desc = "Insert literal/Unicode" })

vim.keymap.set("i", "<M-d>", "<C-k>", { desc = "Insert Digraph" })

vim.keymap.set("n", "<leader>sa", "ggVG")

vim.keymap.set("n", "<leader>hp", function()
  Snacks.dashboard()
end, { desc = "Show Dashboard" })

vim.keymap.set("n", "<leader>tw", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.winrestview(view)
end, { desc = "Trim trailing whitespace" })
