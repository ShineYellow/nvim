local M = {
  "FabijanZulj/blame.nvim"

}

M.config = function()

  local wk = require "which-key"
  wk.register {
    ["<leader>glt"] = { "<cmd>ToggleBlame<cr>", "Toggle Blame" },
  }
end
return M
