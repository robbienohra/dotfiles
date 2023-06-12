require "options"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require "colorscheme"
require "commands"
require "keymaps"
require "user.alpha"
require "user.autopairs"
require "user.autotag"
require "user.cmp"
require "user.colorizer"
require "user.comment"
require "user.fzf"
require "user.harpoon"
require "user.indent"
require "user.lsp"
require "user.lsp.null-ls"
require "user.lualine"
require "user.nvim"
require "user.treesitter"
require "user.vinegar"
