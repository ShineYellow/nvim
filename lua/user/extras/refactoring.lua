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
  wk.register {
    ["<leader>re"] = {
      "<cmd>lua require('refactoring').refactor('Extract Function')<cr>",
      "Extract Function",
      { mode = "x" },
    },
    ["<leader>rf"] = {
      "<cmd>lua require('refactoring').refactor('Extract Function To File')<cr>",
      "Extract Function To File",
      { mode = "x" },
    },
    ["<leader>rv"] = {
      "<cmd>lua require('refactoring').refactor('Extract Variable')<cr>",
      "Extract Variable",
      { mode = "x" },
    },
    ["<leader>rI"] = {
      "<cmd>lua require('refactoring').refactor('Inline Function')<cr>",
      "Inline Function",
      { mode = "n" },
    },
    ["<leader>ri"] = {
      "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
      "Inline Variable",
      { mode = { "n", "x" } },
    },
    ["<leader>rb"] = {
      "<cmd>lua require('refactoring').refactor('Extract Block')<cr>",
      "Extract Block",
      { mode = "n" },
    },
    ["<leader>rbf"] = {
      "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>",
      "Extract Block To File",
      { mode = "n" },
    },
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
