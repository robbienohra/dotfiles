local actions = require "telescope.actions"

require("telescope").setup {
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "bottom",
      mirror = true,
    },
    mappings = {
      i = {
        ["<C-h>"] = actions.select_horizontal,
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "file_browser"
