return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    { "nvim-telescope/telescope-fzf-writer.nvim" },
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    local get_icon = require("astronvim.utils").get_icon

    require('telescope').setup {
      extensions = {
        fzf_writer = {
          minimum_grep_characters = 20,
          minimum_files_characters = 20,
          -- Disabled by default.
          -- Will probably slow down some aspects of the sorter, but can make color highlights.
          -- I will work on this more later.
          use_highlighter = true,
        }
      }
    }

    return {
      defaults = {
        prompt_prefix = string.format("%s ", get_icon "Search"),
        selection_caret = string.format("%s ", get_icon "Selected"),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { ["q"] = actions.close },
        },
      },
    }
  end,
  config = require "plugins.configs.telescope",
}
