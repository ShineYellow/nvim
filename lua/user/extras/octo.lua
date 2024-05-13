local M = {
  "pwntester/octo.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- OR 'ibhagwan/fzf-lua',
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  require("octo").setup()
end

return M
