return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   config = function(_, opts)
  --     local lualine = require("lualine")
  --     opts.globalstatus = false
  --     lualine.setup(opts)
  --
  --     -- Create commands
  --     vim.api.nvim_create_user_command("LualineHide", function()
  --       lualine.hide()
  --     end, {})
  --
  --     vim.api.nvim_create_user_command("LualineShow", function()
  --       lualine.hide({ unhide = true })
  --     end, {})
  --
  --     lualine.hide()
  --   end,
  --
  --   keys = {
  --     { "<leader>mh", "<cmd>LualineHide<cr>", desc = "Hide Lualine" },
  --     { "<leader>ms", "<cmd>LualineShow<cr>", desc = "Show Lualine" },
  --   },
  -- },
}
