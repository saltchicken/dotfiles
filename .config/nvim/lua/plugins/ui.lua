return {
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "nvim-mini/mini.pairs", enabled = false },
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
}
