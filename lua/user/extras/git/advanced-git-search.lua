local M = {
  "aaronhallaert/advanced-git-search.nvim",
  cmd = { "AdvancedGitSearch" },

  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>ga", "<cmd>AdvancedGitSearch<cr>", desc = "AdvancedGitSearch" },
  }
  -- optional: setup telescope before loading the extension
  require("telescope").setup {
    -- move this to the place where you call the telescope setup function
    extensions = {
      advanced_git_search = {
        -- See Config

        -- -- Browse command to open commits in browser. Default fugitive GBrowse.
        -- browse_command = "GBrowse",
        -- -- fugitive or diffview
        -- diff_plugin = "fugitive",
        -- -- customize git in previewer
        -- -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
        -- git_flags = {},
        -- -- customize git diff in previewer
        -- -- e.g. flags such as { "--raw" }
        -- git_diff_flags = {},
        -- -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
        -- show_builtin_git_pickers = false,
        -- entry_default_author_or_date = "author", -- one of "author" or "date"
        -- keymaps = {
        --   -- following keymaps can be overridden
        --   toggle_date_author = "<C-w>",
        --   open_commit_in_browser = "<C-o>",
        --   copy_commit_hash = "<C-y>",
        --   show_entire_commit = "<C-e>",
        -- },
        --
        -- telescope_theme = {
        --   function_name_1 = {
        --     -- Theme options
        --   },
        --   function_name_2 = "dropdown",
        --   -- e.g. realistic example
        --   show_custom_functions = {
        --     layout_config = { width = 0.4, height = 0.4 },
        --   },
        -- },
      },
    },
  }

  require("telescope").load_extension "advanced_git_search"
end

return M
