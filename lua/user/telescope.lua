local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>bb"] = { "<cmd>lua require('telescope.builtin').buffers({sort_mru=true}) previewer=false<cr>", "Find" },

    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    ["<leader>fs"] = { "<cmd>Telescope grep_string<cr>", "Find String" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
    ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "Highlights" },
    ["<leader>fi"] = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
    ["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    ["<leader>fr"] = { "<cmd>lua require('telescope.builtin').oldfiles({only_cwd=true}) <cr>", "Recent File" },
    ["<leader>fR"] = { "<cmd>Telescope registers<cr>", "Registers" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "Commands" },
    ["<leader>go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    ["<leader>gC"] = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },

    ["<leader>fq"] = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function(ctx)
      vim.api.nvim_buf_call(ctx.buf, function()
        vim.fn.matchadd("TelescopeParent", "\t\t.*$")
        vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
      end)
    end,
  })

  local icons = require "user.icons"
  local actions = require "telescope.actions"

  local function filenameFirst(_, path)
    local tail = vim.fs.basename(path)
    local parent = vim.fs.dirname(path)
    if parent == "." then
      return tail
    end
    return string.format("%s\t\t%s", tail, parent)
  end

  local function select_all_but_current(prompt_bufnr)
    actions.select_all(prompt_bufnr)
    actions.toggle_selection(prompt_bufnr)
  end

  local function delete_all_but_current(prompt_bufnr)
    actions.select_all(prompt_bufnr)
    actions.toggle_selection(prompt_bufnr)
    actions.delete_buffer(prompt_bufnr)
  end

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. "  ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        -- Exclude some patterns from search
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
          ["a"] = actions.toggle_all,
          ["A"] = select_all_but_current,
          ["x"] = delete_all_but_current,

        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
        path_display = filenameFirst,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        select_current = true,
        -- sort_mru = true,
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_document_symbols = {
        symbol_width = 50,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
