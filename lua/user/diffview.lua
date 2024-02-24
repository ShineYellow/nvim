local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}

function M.config() end
  require("dap-go").setup()

  local wk = require "which-key"
  wk.register {
    ["<leader>gdh"] = { "<cmd>DiffviewFileHistory %<cr>", "current file history" },
    ["<leader>gdH"] = { "<cmd>DiffviewFileHistory<cr>", "current branch history" },
    ["<leader>gdx"] = { "<cmd>DiffviewClose<cr>", "close" },
    ["<leader>gdt"] = { "<cmd>DiffviewToggleFiles<cr>", "Toggle the file panel" },
  }

return M
