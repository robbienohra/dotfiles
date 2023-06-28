-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-esc-to-quit-in-insert-mode
local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"
require("telescope").setup {
  defaults = {
    layout_strategy = "vertical",
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview,
      },
      i = {
        ["<esc>"] = actions.close,
        ["<M-p>"] = action_layout.toggle_preview,
      },
    },
  },
}

require("telescope").load_extension "fzf"
