local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local harpoon = require "harpoon"
  harpoon:setup {
    settings = {
      save_on_toggle = true,
    },
  }

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<s-m>", "<cmd>lua require('user.extras.harpoon').mark_file()<cr>", opts)
  keymap("n", "<s-f>", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>", opts)
  keymap("n", "1", "<cmd>lua require('harpoon'):list():select(1)<cr>", opts)
  keymap("n", "2", "<cmd>lua require('harpoon'):list():select(2)<cr>", opts)
  keymap("n", "3", "<cmd>lua require('harpoon'):list():select(3)<cr>", opts)
  keymap("n", "4", "<cmd>lua require('harpoon'):list():select(4)<cr>", opts)
  -- N is for pre occur when searching
  -- keymap("n", "<s-n>", "<cmd>lua require('harpoon'):list():next()<cr>", opts)
  -- keymap("n", "<s-p>", "<cmd>lua require('harpoon'):list():prev()<cr>", opts)
end

function M.mark_file()
  local harpoon = require "harpoon"
  harpoon:list():add()
  vim.notify "󱡅  marked file"
end

return M
