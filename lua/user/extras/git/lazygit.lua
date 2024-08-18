local M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
  }
end

return M
