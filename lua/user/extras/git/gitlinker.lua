local M = {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  event = "VeryLazy",
}
-- GitLink: generate git link and copy to clipboard.
-- GitLink!: generate git link and open in browser.
-- GitLink blame: generate the /blame url and copy to clipboard.
-- GitLink! blame: generate the /blame url and open in browser.

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>gY", "<cmd>GitLink! remote=upstream<cr>", desc = "Git link" },
    { "<leader>gy", "<cmd>GitLink!<cr>", desc = "Git link" },
  }

  require("gitlinker").setup {
    -- print message in command line
    message = true,

    -- key mapping
    -- mapping = {
    --   ["<leader>gY"] = {
    --     -- copy git link to clipboard
    --     action = require("gitlinker.actions").clipboard,
    --     desc = "Copy git link to clipboard",
    --   },
    --   ["<leader>gy"] = {
    --     -- open git link in browser
    --     action = require("gitlinker.actions").system,
    --     desc = "Open git link in browser",
    --   },
    -- },

    -- write logs to console(command line)
    console_log = true,
  }
end

return M
