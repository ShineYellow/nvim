local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local mappings = {
    { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
    { "<leader>A", "<cmd>ASToggle<CR>", desc = "AutoSave" },
    { "<leader>M", group = "Markdown" },
    { "<leader>T", group = "Treesitter" },
    { "<leader>_", "<cmd>split<CR>", desc = "Split --" },
    { "<leader>a", group = "Tab" },
    { "<leader>aN", "<cmd>tabnew %<cr>", desc = "New Tab" },
    { "<leader>ah", "<cmd>-tabmove<cr>", desc = "Move Left" },
    { "<leader>al", "<cmd>+tabmove<cr>", desc = "Move Right" },
    { "<leader>an", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
    { "<leader>ao", "<cmd>tabonly<cr>", desc = "Only" },
    { "<leader>b", group = "Buffers" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>gh", group = "Diff View" },
    { "<leader>gl", group = "Blame" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    { "<leader>l", group = "LSP" },
    { "<leader>p", group = "Plugins" },
    { "<leader>q", "<cmd>:call QuickFixToggle()<CR>", desc = "QuickFixToggle" },
    { "<leader>t", group = "Test" },
    { "<leader>v", "<cmd>vsplit<CR>", desc = "Split |" },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
    { "<leader>x", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>|", "<cmd>vsplit<CR>", desc = "Split |" },
    { "<leader>r", group = "refactoring", mode = { "n", "v" } },
  }

  local which_key = require "which-key"
  which_key.setup ()
    -- plugins = {
    --   marks = true,
    --   registers = true,
    --   spelling = {
    --     enabled = true,
    --     suggestions = 20,
    --   },
    --   presets = {
    --     operators = false,
    --     motions = false,
    --     text_objects = false,
    --     windows = false,
    --     nav = false,
    --     z = false,
    --     g = false,
    --   },
    -- },
    -- window = {
    --   border = "rounded",
    --   position = "bottom",
    --   padding = { 2, 2, 2, 2 },
    -- },
    -- ignore_missing = true,
    -- show_help = false,
    -- show_keys = false,
    -- disable = {
    --   buftypes = {},
    --   filetypes = { "TelescopePrompt" },
    -- },
 

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.add(mappings, opts)
end

return M
