local M = {
  "ellisonleao/glow.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>Mg", "<cmd>Glow<CR>", desc = "Glow" },
  }

  require("glow").setup()
end

return M
