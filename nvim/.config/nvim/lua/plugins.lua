return {
  -- plugin management
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
  },
  -- lsp
  {
    "jose-elias-alvarez/null-ls.nvim",
    "mfussenegger/nvim-dap",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  },
  -- dev
  {
    "Yggdroot/indentLine",
    "mhinz/vim-signify",
    "norcalli/nvim-colorizer.lua",
    "numToStr/Comment.nvim",
    "p00f/nvim-ts-rainbow",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    { "luisiacc/gruvbox-baby", branch = "main" },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    },
    {

      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ",
      },
    },
  },
  -- utilities
  {
    "ThePrimeagen/harpoon",
    "junegunn/vim-peekaboo",
    { "junegunn/fzf", build = ":call fzf#install()" },
    { "junegunn/fzf.vim" },
    {
      "goolord/alpha-nvim",
    },
    "dkarter/bullets.vim",
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.2",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  -- tpope goodies
  {
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb", -- required by fugitive to :Gbrowse
    "tpope/vim-scriptease",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-vinegar",
    "preservim/vim-pencil",
  },
}
