local M = {
  "f-person/git-blame.nvim",

}

M.config = function()

  require('gitblame').setup {
    enabled = false,
  }

  local icons = require "user.icons"

  local wk = require "which-key"
  wk.register {
    ["<leader>gt"] = { "<cmd>GitBlameToggle<cr>", "Toggle Blame" },
  }
end
return M
