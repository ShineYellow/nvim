local M = {
  "ellisonleao/glow.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>Mg"] = { "<cmd>Glow<CR>", "Glow" },
  }

  require("glow").setup()
end

return M
