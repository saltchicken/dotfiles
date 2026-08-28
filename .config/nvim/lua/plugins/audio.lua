return {
  {
    "gruvw/strudel.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local strudel = require("strudel")

      require("strudel").setup({
        auto_update = true,
        -- headless = true,
      })

      -- Automatically create hotkeys only when opening a Strudel file
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.str", "*.std" },
        callback = function(args)
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
          end

          -- Launch & Lifecycle
          map("n", "<leader>sl", strudel.launch, "Launch Strudel")
          map("n", "<leader>sq", strudel.quit, "Quit Strudel")

          -- Playback Controls
          map("n", "<leader>st", strudel.toggle, "Strudel Toggle Play/Stop")
          map("n", "<leader>ss", strudel.stop, "Strudel Stop Playback")

          -- Buffer & Evaluation
          map("n", "<leader>su", strudel.update, "Strudel Update")
          map("n", "<leader>sb", strudel.set_buffer, "Strudel set current buffer")
          map("n", "<leader>sx", strudel.execute, "Strudel set current buffer and update")

          -- Live-coding Ctrl+Enter evaluation
          map({ "n", "i" }, "<C-CR>", strudel.update, "Strudel Update")
        end,
      })
    end,
  },
  {
    "grddavies/tidal.nvim",
    opts = {
      -- Your configuration here
      -- See configuration section for defaults
    },
    -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "haskell", "supercollider" } },
    },
  },
}
