return {
  { "simrat39/rust-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- always off
        virtual_lines = true, -- start with under-line diagnostics
      },
    },
    keys = {
      {
        "<leader>uv",
        function()
          local cfg = vim.diagnostic.config()
          local new_state = not cfg.virtual_lines
          vim.diagnostic.config({
            virtual_lines = new_state,
            virtual_text = false, -- keep it off
          })
          vim.notify("Virtual lines " .. (new_state and "enabled" or "disabled"))
        end,
        desc = "Toggle virtual lines (under-line diagnostics)",
      },
    },
  },
}
