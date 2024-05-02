local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "nvim-neotest/neotest-go",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
  },
}
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap( "n", "[n" , "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", opts)
keymap( "n", "]n"  ,"<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", opts)

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>tt"] = { "<cmd>lua require'neotest'.run.run()<cr>", "Test Nearest" },
    ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
    ["<leader>td"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Test" },
    ["<leader>ts"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Test Stop" },
    ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach Test" },
    ["<leader>to"] = { "<cmd>lua require('neotest').output.open()<cr>", "Test outut preview" },
    ["<leader>tp"] = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Test output panel" },
    ["<leader>tj"] = { "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", "Next Failed" },
    ["<leader>tk"] = { "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", "Prev Failed" },
  }

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-go",
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require "neotest-vitest",
      require "neotest-zig",
      require "neotest-rust",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
  }
end

return M
