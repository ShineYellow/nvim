local M = {
  "ThePrimeagen/git-worktree.nvim",
}

M.config = function()
  require("telescope").load_extension "git_worktree"
  require("git-worktree").setup {}

  local wk = require "which-key"
  wk.add {
    {
      "<leader>gK",
      "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
      desc = "create a worktrees",
    },
    { "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", desc = "worktrees" },
  }
end

return M
