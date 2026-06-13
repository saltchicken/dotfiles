return {
  {
    "saltchicken/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.CursorLine = { bg = "#1E2229" }
        hl.Folded = { bg = "#1E2229" }
        hl.StatusLine = { bg = "#1E2229" }
        hl.StatusLineNC = { bg = "#1E2229" }
      end,
    },
  },
  { "aliqyan-21/darkvoid.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },
}
