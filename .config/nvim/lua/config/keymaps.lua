vim.keymap.set("n", "<leader>hp", function()
  Snacks.dashboard()
end, { desc = "Show Dashboard" })

vim.keymap.set("n", "<leader>tw", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.winrestview(view)
end, { desc = "Trim trailing whitespace" })
