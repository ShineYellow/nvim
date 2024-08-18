-- https://github.com/mrcjkb/rustaceanvim/tree/master
local M = {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>rI", "<cmd>lua require('refactoring').refactor('Inline Function')<cr>", desc = "Inline Function" },
    { "<leader>rb", "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", desc = "Extract Block" },
    { "<leader>rbf", "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>", desc = "Extract Block To File" },
    { "<leader>re", "<cmd>lua require('refactoring').refactor('Extract Function')<cr>", desc = "Extract Function" },
    { "<leader>rf", "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>", desc = "Extract Function To File" },
    { "<leader>ri", "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>", desc = "Inline Variable" },
    { "<leader>rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>", desc = "Extract Variable" },
  }

  require("refactoring").setup {
    prompt_func_return_type = {
      go = false,
      java = false,

      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    prompt_func_param_type = {
      go = false,
      java = false,

      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = false, -- shows a message with information about the refactor on success
    -- i.e. [Refactor] Inlined 3 variable occurrences
  }
end

return M
