local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use({
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/nvim-cmp",
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
  })
  use({
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb", -- required by fugitive to :Gbrowse
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-vinegar",
  })
  use({
    "junegunn/fzf.vim",
    { "junegunn/fzf", run = ":call fzf#install()" },
    "junegunn/vim-peekaboo",
  })
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "jose-elias-alvarez/null-ls.nvim",
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    { "michaelb/sniprun", run = "bash ./install.sh" },
  })
  use({ "luisiacc/gruvbox-baby", branch = "main" })
  use("Yggdroot/indentLine")
  use("hoob3rt/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("mhinz/vim-signify")
  use("norcalli/nvim-colorizer.lua")
  use("numToStr/Comment.nvim")
  use("nvim-lua/plenary.nvim")
  use("plasticboy/vim-markdown")
  use("reedes/vim-pencil")
  use("rktjmp/lush.nvim")
  use("wbthomason/packer.nvim")
  use("windwp/nvim-autopairs")
  use("mickael-menu/zk-nvim")
end)
