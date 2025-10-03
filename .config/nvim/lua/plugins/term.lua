return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- Set the default direction to floating
        direction = "float",

        -- Always start in insert mode and don't remember the last mode
        start_in_insert = true,
        persist_mode = false,

        -- THIS IS THE NEWLY ADDED SECTION --
        -- This function runs every time a terminal is opened
        on_open = function(term)
          -- Map the Escape key to enter normal mode, but only for this terminal buffer
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<cmd>stopinsert<CR>", {
            noremap = true,
            silent = true,
            desc = "Enter normal mode",
          })
        end,

        -- Options for the floating window
        float_opts = {
          border = "curved",
          width = function()
            return math.floor(vim.api.nvim_get_option("columns") * 0.8)
          end,
          height = function()
            return math.floor(vim.api.nvim_get_option("lines") * 0.8)
          end,
        },
      })

      -- Keymap for toggling the terminal from within the terminal buffer
      local toggle_term_cmd = "<Cmd>ToggleTerm<CR>"
      vim.keymap.set("t", "<M-i>", "<C-\\><C-n>" .. toggle_term_cmd, { desc = "Toggle floating terminal" })
    end,
    -- Keymaps for normal and insert mode
    keys = {
      {
        "<M-i>",
        "<Cmd>ToggleTerm<CR>",
        mode = "n",
        desc = "Toggle floating terminal",
      },
      {
        "<M-i>",
        "<Esc><Cmd>ToggleTerm<CR>",
        mode = "i",
        desc = "Toggle floating terminal",
      },
    },
  },
}
