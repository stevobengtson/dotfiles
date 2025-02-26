return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby",
    },
    config = function()
      require("dap-ruby").setup()
      local dap = require("dap")
      dap.configurations.ruby = {
        {
          type = "ruby",
          request = "launch",
          name = "Launch file",
          program = "${file}",
        },
      }
    end,
  },
  -- Fancy UI for DAP
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<leader>de",
        function()
          -- Calling this twice to open and jump into the window.
          require("dapui").eval()
          require("dapui").eval()
        end,
        desc = "Evaluate expression",
      },
    },
    opts = {
      layouts = {
        {
          elements = {
            { id = "stacks", size = 0.30 },
            { id = "breakpoints", size = 0.20 },
            { id = "scopes", size = 0.50 },
          },
          position = "left",
          size = 40,
        },
      },
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup(opts)

      -- Automatically open the UI when a new debug session is created.
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
}
