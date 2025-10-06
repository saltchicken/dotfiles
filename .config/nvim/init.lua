-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.laststatus = 0

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.mouse = ""
  end,
})
