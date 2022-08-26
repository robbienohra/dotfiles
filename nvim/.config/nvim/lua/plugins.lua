local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

local packer_bootstrap
-- https://github.com/wbthomason/packer.nvim/issues/718#issuecomment-1009018188
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

vim.cmd "packadd packer.nvim"

return require("packer").startup(function(use)
  use {
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb", -- required by fugitive to :Gbrowse
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-vinegar",
  }
  -- theming
  use {
    {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    },
    { "luisiacc/gruvbox-baby", branch = "main" },
  }
  -- development
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-github.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
  }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use {
    "Yggdroot/indentLine",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/nvim-cmp",
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "jose-elias-alvarez/null-ls.nvim",
    "mfussenegger/nvim-dap",
    "mhinz/vim-signify",
    "neovim/nvim-lspconfig",
    "norcalli/nvim-colorizer.lua",
    "numToStr/Comment.nvim",
    "p00f/nvim-ts-rainbow",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  }
  use { "wbthomason/packer.nvim", opt = true }
  if packer_bootstrap then
    require("packer").sync()
  end
end)
