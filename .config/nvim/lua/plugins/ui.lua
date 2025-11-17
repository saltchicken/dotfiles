return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "nvim-mini/mini.pairs", enabled = false },
  -- {
  --   "nvim-mini/mini.pairs",
  --   opts = {
  --     modes = { insert = true, command = false, terminal = false },
  --     mappings = {
  --       ["("] = false,
  --       ["{"] = false,
  --       ["["] = false,
  --       ["'"] = false,
  --       ['"'] = false,
  --       ["`"] = false,
  --     },
  --   },
  -- },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      -- The main configuration table for all pickers
      picker = {
        -- Configure the default settings for different sources
        sources = {
          -- Here we target the 'explorer' source from the file you found
          explorer = {
            -- And finally, we set the option we want to override
            auto_close = true,

            -- You can override any other explorer setting here too!
            -- For example:
            -- follow_file = false,
          },
        },
      },
    },
  },
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
    "saltchicken/code-context.nvim",
    config = function()
      local code_context = require("code_context")
      code_context.setup({})
    end,
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
