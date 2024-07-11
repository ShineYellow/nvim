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
          wk.register {
            ["<leader>dt"] = { "<cmd>lua require'dap-go'.debug_test()<cr>", "Debug test" },
            ["<leader>dl"] = { "<cmd>lua require'dap-go'.debug_last_test()<cr>", "Debug last test" },
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
  wk.register {
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    -- ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dc"] = { "<cmd>lua require'telescope'.extensions.dap.configurations()<cr>", "configurations" },
    ["<leader>da"] = { "<cmd>lua require'telescope'.extensions.dap.commands()<cr>", "all commands" },
    ["<leader>dC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    -- ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    ["<leader>dl"] = { "<cmd>lua require'telescope'.extensions.dap.list_breakpoints()<cr>", "Quit" },
    ["<leader>dv"] = { "<cmd>lua require'telescope'.extensions.dap.variables()<cr>", "variables" },
    ["<leader>df"] = { "<cmd>lua require'telescope'.extensions.dap.frames()<cr>", "frames" },
  }

  vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.step_into()<CR>")
  vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>")
  vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.step_out()<CR>")
  vim.keymap.set("n", "<F8>", "<cmd>lua require'dap'.continue()<CR>")
end

return M
