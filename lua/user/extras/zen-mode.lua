
local M = {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
}

function M.config()

  local wk = require "which-key"
  wk.register {
    ["<leader>z"] = { "<cmd>ZenMode<CR>", "Zen Mode" },
  }
end

return M

