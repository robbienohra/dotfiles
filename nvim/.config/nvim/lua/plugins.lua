return require("packer").startup(function()
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
  use("jose-elias-alvarez/null-ls.nvim")
  use("junegunn/fzf.vim")
  use("junegunn/vim-peekaboo")
  use("kyazdani42/nvim-web-devicons")
  use("leafOfTree/vim-svelte-plugin")
  use("leafOfTree/vim-vue-plugin")
  use("mhinz/vim-signify")
  use("neovim/nvim-lspconfig")
  use("norcalli/nvim-colorizer.lua")
  use("numToStr/Comment.nvim")
  use("nvim-lua/plenary.nvim")
  use("plasticboy/vim-markdown")
  use("reedes/vim-pencil")
  use("rktjmp/lush.nvim")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb") -- required by fugitive to :Gbrowse
  use("tpope/vim-unimpaired")
  use("tpope/vim-vinegar")
  use("wbthomason/packer.nvim")
  use("windwp/nvim-autopairs")
  use({ "junegunn/fzf", run = ":call fzf#install()" })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
  use({ "luisiacc/gruvbox-baby", branch = "main" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
end)