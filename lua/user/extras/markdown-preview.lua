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
  wk.register {
    ["<leader>MM"] = { "<cmd>MarkdownPreview<CR>", "MarkdownPreview" },
  }

end

return M
