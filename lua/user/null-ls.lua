local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting

  null_ls.setup {
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier,
      null_ls.builtins.formatting.terraform_fmt,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
      null_ls.builtins.diagnostics.terraform_validate,
      null_ls.builtins.diagnostics.tfsec,
      null_ls.builtins.diagnostics.golangci_lint,
    },
  }
end

return M
