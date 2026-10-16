-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.mousescroll = "ver:1,hor:6"

-- 1. Tell Neovim to treat .vital files as JSON for syntax highlighting
vim.filetype.add({
  extension = {
    vital = "json",
  },
})

-- 2. Automatically pretty-print .vital files when you open them
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.vital",
  callback = function()
    -- Save current view/cursor position
    local view = vim.fn.winsaveview()

    -- Pipe the file through 'jq' to format it (or use 'python3 -m json.tool' if you don't have jq)
    vim.cmd("silent %!jq .")

    -- Restore view/cursor position
    vim.fn.winrestview(view)

    -- Clear the 'modified' flag so Neovim doesn't prompt you to save when quitting
    vim.bo.modified = false
  end,
})
