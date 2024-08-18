local M = {
  "FabijanZulj/blame.nvim"

}

M.config = function()

  local wk = require "which-key"
  wk.add {
        { "<leader>glt", "<cmd>ToggleBlame<cr>", desc = "Toggle Blame" },

  }
end
return M
