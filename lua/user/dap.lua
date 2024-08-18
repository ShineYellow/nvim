local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
          local dap, dapui = require "dap", require "dapui"
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()

          local wk = require "which-key"
          wk.add {
            { "<leader>dl", "<cmd>lua require'dap-go'.debug_last_test()<cr>", desc = "Debug last test" },
            { "<leader>dt", "<cmd>lua require'dap-go'.debug_test()<cr>", desc = "Debug test" },
          }
        end,
      },
      "mfussenegger/nvim-dap-python",
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require("telescope").load_extension "dap"
        end,
      },
    },
  },
}

local function setup_go() end

function M.config()
  local wk = require "which-key"
  wk.add {
    -- ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    -- ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
    { "<leader>da", "<cmd>lua require'telescope'.extensions.dap.commands()<cr>", desc = "all commands" },
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>lua require'telescope'.extensions.dap.configurations()<cr>", desc = "configurations" },
    { "<leader>dd", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    { "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames()<cr>", desc = "frames" },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    { "<leader>dL", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints()<cr>", desc = "Quit" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
    { "<leader>ds", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
    { "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables()<cr>", desc = "variables" },
  }

  vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.step_into()<CR>")
  vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>")
  vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.step_out()<CR>")
  vim.keymap.set("n", "<F8>", "<cmd>lua require'dap'.continue()<CR>")
end

return M
