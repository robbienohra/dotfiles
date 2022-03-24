-- local fn = vim.fn

-- Automatically install packer
-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system {
--     "git",
--     "clone",
--     "--depth",
--     "1",
--     "https://github.com/wbthomason/packer.nvim",
--     install_path,
--   }
--   print "Installing packer close and reopen Neovim..."
--   vim.cmd [[packadd packer.nvim]]
-- end
--
-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

return packer.startup(function(use)
  use("Yggdroot/indentLine")
  use("ellisonleao/gruvbox.nvim")
  use("hoob3rt/lualine.nvim")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")
  use("hrsh7th/vim-vsnip-integ")
  use("jose-elias-alvarez/null-ls.nvim")
  use("junegunn/fzf.vim")
  use("junegunn/vim-peekaboo")
  use("kyazdani42/nvim-web-devicons")
  use("leafOfTree/vim-svelte-plugin")
  use("leafOfTree/vim-vue-plugin")
  use("mhinz/vim-signify")
  use("norcalli/nvim-colorizer.lua")
  use("numToStr/Comment.nvim")
  use("nvim-lua/plenary.nvim")
  use("plasticboy/vim-markdown")
  use("reedes/vim-pencil")
  use("rktjmp/lush.nvim")
  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-rhubarb") -- required by fugitive to :Gbrowse
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-vinegar")
  use("wbthomason/packer.nvim")
  use("windwp/nvim-autopairs")
  use({ "junegunn/fzf", run = ":call fzf#install()" })
  use({ "luisiacc/gruvbox-baby", branch = "main" })
  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  })
end)
