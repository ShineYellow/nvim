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
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },

      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup {
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            debugger_path = vim.fn.resolve(vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"),
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
          }

          for _, language in ipairs { "typescript", "javascript" } do
            require("dap").configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
              },
              {
                type = "pwa-node",
                request = "launch",
                name = "Debug Jest Tests",
                -- trace = true, -- include debugger info
                runtimeExecutable = "node",
                runtimeArgs = {
                  "./node_modules/jest/bin/jest.js",
                  "--runInBand",
                },
                rootPath = "${workspaceFolder}",
                cwd = "${workspaceFolder}",
                console = "integratedTerminal",
                internalConsoleOptions = "neverOpen",
              },
            }
          end
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
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    ["<leader>dl"] = { "<cmd>lua require'telescope'.extensions.dap.list_breakpoints()<cr>", "Quit" },
  }

  vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.step_into()<CR>")
  vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>")
  vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.step_out()<CR>")
  vim.keymap.set("n", "<F8>", "<cmd>lua require'dap'.continue()<CR>")
end

return M
