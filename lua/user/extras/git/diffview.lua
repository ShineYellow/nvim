local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}

function M.config() end
require("dap-go").setup()

local wk = require "which-key"
wk.add {
  { "<leader>ghH", "<cmd>DiffviewFileHistory<cr>", desc = "current branch history" },
  { "<leader>ghh", "<cmd>DiffviewFileHistory %<cr>", desc = "current file history" },
  { "<leader>ght", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle the file panel" },
  { "<leader>ghx", "<cmd>DiffviewClose<cr>", desc = "close" },
}

return M
