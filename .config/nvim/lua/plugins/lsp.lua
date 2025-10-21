return {
  { "simrat39/rust-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- disable inline text
        virtual_lines = true, -- show under the line
      },
    },
  },
}
