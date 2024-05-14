local M = {
  "ThePrimeagen/git-worktree.nvim",
}

M.config = function()
  require("telescope").load_extension "git_worktree"
  require("git-worktree").setup {}

  local wk = require "which-key"
  wk.register {
    ["<leader>gw"] = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "worktrees" },
    ["<leader>gK"] = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", "create a worktrees" },

  }
end

return M
