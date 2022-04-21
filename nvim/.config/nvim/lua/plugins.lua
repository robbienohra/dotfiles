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
  use({ "windwp/nvim-autopairs", "windwp/nvim-ts-autotag" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "jose-elias-alvarez/null-ls.nvim",
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "mfussenegger/nvim-dap",
  })
  use({ "preservim/vim-markdown", { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" } })
  use({ "luisiacc/gruvbox-baby", branch = "main" })
  use("Yggdroot/indentLine")
  use("numToStr/Comment.nvim")
  use("mhinz/vim-signify")
  use("norcalli/nvim-colorizer.lua")
  use("rktjmp/lush.nvim")
  use("nvim-lua/plenary.nvim")
  use("mickael-menu/zk-nvim")
  use("wbthomason/packer.nvim")
  use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
end)
