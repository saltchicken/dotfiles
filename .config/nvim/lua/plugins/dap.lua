return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Installs and configures debug adapters
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim" },
        opts = {
          ensure_installed = {
            "go", -- For Go
            "python", -- For Python
            "codelldb", -- For C++
          },
          automatic_installation = true,
          handlers = {},
        },
      },

      -- UI for DAP
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },

      -- Language-specific plugins
      { "leoluz/nvim-dap-go" },
      { "mfussenegger/nvim-dap-python" },

      -- Nice to have: virtual text for debugging info
      { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      --## DAP UI Setup ##--
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.35 },
              { id = "breakpoints", size = 0.15 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "left",
          },
          {
            elements = { { id = "repl", size = 0.5 }, { id = "console", size = 0.5 } },
            size = 0.25,
            position = "bottom",
          },
        },
      })

      -- Automatically open/close the UI when a debug session starts/stops
      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      --## Language-specific Setup ##--
      require("dap-go").setup()
      require("dap-python").setup()

      --## Virtual Text Setup ##--
      require("nvim-dap-virtual-text").setup({
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
            return "******"
          end
          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end
          return " " .. variable.value
        end,
      })

      --## Keymaps ##--
      vim.keymap.set("n", "<leader>du", function()
        ui.toggle()
      end, { desc = "DAP UI" })
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, { desc = "Continue" })
      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dO", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>d?", function()
        ui.eval(nil, { enter = true })
      end, { desc = "Eval" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Conditional Breakpoint" })
    end,
  },
}
