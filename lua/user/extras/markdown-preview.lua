local M = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}

function M.config()
  local wk = require "which-key"
  wk.add {
     { "<leader>MM", "<cmd>MarkdownPreview<CR>", desc = "MarkdownPreview" },
  }

end

return M
