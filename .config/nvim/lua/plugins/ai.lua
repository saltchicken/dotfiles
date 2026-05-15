return {
  {
    "saltchicken/context.nvim",
    -- dir = "~/projects/context.nvim", -- Use this if testing locally

    -- 1. Define the keymaps here for automatic lazy-loading
    keys = {
      {
        "<leader>cp",
        function()
          -- Open Neovim's native input prompt
          vim.ui.input({ prompt = "LLM Prompt: " }, function(input)
            -- If the user presses <Esc>, 'input' will be nil. Exit early.
            if not input then
              return
            end

            vim.notify("Gathering context...", vim.log.levels.INFO, { title = "context.nvim" })

            -- Call the programmatic API with the input
            require("context").gather({ ".", "--prompt", input }, function(output)
              vim.schedule(function()
                vim.fn.setreg("+", output)
                vim.notify("Context + Prompt copied to clipboard!", vim.log.levels.INFO, { title = "context.nvim" })
              end)
            end)
          end)
        end,
        desc = "Context: Prompt and Copy",
      },
    },

    -- 2. Keep your existing setup block exactly as it was
    config = function()
      require("context").setup({
        notify = true,
        -- Optionally add default args you always want applied
        -- default_args = { "--max-size", "500000" }
      })
    end,
  },
  {
    "saltchicken/search-replace.nvim",
    cmd = "SearchReplace",
    keys = {
      {
        "<leader>ai",
        function()
          require("search_replace.ui").open_input()
        end,
        desc = "Open Search Replace Apply Box",
      },
    },
    opts = {},
  },
}
