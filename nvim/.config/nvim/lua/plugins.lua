local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use {
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb", -- required by fugitive to :Gbrowse
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-vinegar",
  }
  use {
    "junegunn/fzf.vim",
    "junegunn/vim-peekaboo",
    { "junegunn/fzf", run = ":call fzf#install()" },
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
    "ms-jpq/coq_nvim",
    "neovim/nvim-lspconfig",
    "norcalli/nvim-colorizer.lua",
    "numToStr/Comment.nvim",
    -- "rktjmp/lush.nvim",
    "williamboman/nvim-lsp-installer",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  }
  use { "preservim/vim-markdown", { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" } }
  use "mickael-menu/zk-nvim"
  use "nvim-lua/plenary.nvim"
  use "wbthomason/packer.nvim"
  use { "ckipp01/nvim-jenkinsfile-linter" }
end)
