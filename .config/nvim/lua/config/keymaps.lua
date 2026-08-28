vim.keymap.set("n", "<leader>hp", function()
  Snacks.dashboard()
end, { desc = "Show Dashboard" })

vim.keymap.set("n", "<leader>tw", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.winrestview(view)
end, { desc = "Trim trailing whitespace" })

local function toggle_tidal_term()
  -- Find any buffer running the ghci / tidal process
  local target_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "terminal" then
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("ghci") or name:match("tidal") then
        target_buf = buf
        break
      end
    end
  end

  if not target_buf then
    vim.notify("No active Tidal terminal found", vim.log.levels.WARN)
    return
  end

  -- Check if the terminal is currently visible in any open window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == target_buf then
      vim.api.nvim_win_close(win, false)
      return
    end
  end

  -- If hidden, open it in a bottom split
  vim.cmd("botright split")
  vim.api.nvim_win_set_buf(0, target_buf)
  vim.api.nvim_win_set_height(0, 12)
end

-- Map to <leader>tt (or your preferred key combination)
vim.keymap.set("n", "<leader>tt", toggle_tidal_term, { desc = "Toggle Tidal Terminal" })
