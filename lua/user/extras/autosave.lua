local M = {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
}

M.config = function()
  require("auto-save").setup {
    condition = function(buf)
      if vim.bo[buf].filetype == "harpoon" then
        return false
      end

      local fn = vim.fn
      local utils = require "auto-save.utils.data"

      if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
        return true -- met condition(s), can save
      end

      return false -- can't save
    end,
  }
end

return M
