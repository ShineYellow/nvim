local M = {
  "Pocco81/auto-save.nvim",
}

M.config = function()
  require("auto-save").setup()
end

return M
