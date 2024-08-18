local M = {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
  }
  require("zen-mode").toggle {
    window = {
      width = 1,
    },
  }
end

return M
