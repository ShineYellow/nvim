local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}

function M.config() end
  require("dap-go").setup()

  local wk = require "which-key"
  wk.register {
    ["<leader>ghh"] = { "<cmd>DiffviewFileHistory %<cr>", "current file history" },
    ["<leader>ghH"] = { "<cmd>DiffviewFileHistory<cr>", "current branch history" },
    ["<leader>ghx"] = { "<cmd>DiffviewClose<cr>", "close" },
    ["<leader>ght"] = { "<cmd>DiffviewToggleFiles<cr>", "Toggle the file panel" },
  }

return M
