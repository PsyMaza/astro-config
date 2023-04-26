return {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "nvim-telescope/telescope-fzf-writer.nvim",
  },
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    require("plugins.configs.telescope")(plugin, opts)

    -- require telescope and load extensions as necessary
    local telescope = require "telescope"

    telescope.setup({
      file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip",
        ".pkg/", "%.go" },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        fzf_writer = {
          minimum_grep_characters = 3,
          minimum_files_characters = 3,
          -- Disabled by default.
          -- Will probably slow down some aspects of the sorter, but can make color highlights.
          -- I will work on this more later.
          use_highlighter = true,
        }
      }
    })

    -- telescope.load_extension "fzf"
    telescope.load_extension "fzf_writer"
  end,
}
