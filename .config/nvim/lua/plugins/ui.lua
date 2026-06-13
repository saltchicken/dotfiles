return {
  { "nvim-lualine/lualine.nvim", enabled = false },
  -- { "nvim-mini/mini.pairs", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            auto_close = true,
          },
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
      { "<leader>bx", "<cmd>bdelete<cr>", desc = "Close Buffer" },
      {
        "<leader>uB",
        function()
          if vim.o.showtabline == 0 then
            vim.o.showtabline = 2
            vim.notify("Bufferline shown")
          else
            vim.o.showtabline = 0
            vim.notify("Bufferline hidden")
          end
        end,
        desc = "Toggle Bufferline",
      },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        -- separator_style = "slant",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = ":call mkdp#util#install()",
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        shell = "/usr/bin/fish", -- Forces Toggleterm to drop straight into Fish
        float_opts = {
          border = "curved",
          winblend = 0, -- Set to 0 for a solid background to prevent text overlap
        },
        open_mapping = [[<c-\>]],

        -- Ties the window colors directly to Solarized Osaka
        highlights = {
          Normal = { link = "Normal" },
          NormalFloat = { link = "NormalFloat" },
          FloatBorder = { link = "FloatBorder" },
        },
      })

      -- Optional but highly recommended:
      -- Allows you to press Esc to exit terminal insert mode
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = false, -- "Name" codes like Blue or Red
          css = true, -- Enable all CSS features: rgb(), hsl(), etc.
          mode = "virtualtext", -- Set to "background" to color the text background instead
        },
      })
    end,
  },
}
