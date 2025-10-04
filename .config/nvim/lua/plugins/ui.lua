return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      local completion_toggle = Snacks.toggle({
        name = "Completion",
        get = function()
          return vim.b.completion
        end,
        set = function(state)
          vim.b.completion = state
        end,
      })

      local function toggle_completion()
        require("blink.cmp").hide()
        completion_toggle:toggle()
      end

      vim.keymap.set({ "i", "n" }, "<C-q>", toggle_completion, { desc = "Toggle Completion" })
      opts.enabled = function()
        return vim.b.completion
      end

      return opts
    end,
  },
  {
    "saltchicken/keep.nvim",
    config = function()
      local keep = require("keep")

      keep.setup({
        dir = "~/.master/my-notes/",
      })
    end,
    dependencies = {
      "folke/snacks.nvim", -- sidebar explorer
    },
  },

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
