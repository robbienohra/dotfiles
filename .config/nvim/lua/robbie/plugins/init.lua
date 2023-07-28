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

require("lazy").setup {
	-- plugin management
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"nvim-lua/plenary.nvim",
	},
	-- lsp
	{
		"mfussenegger/nvim-dap",
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
			config = function()
				require "robbie.plugins.lsp"
			end,
		},
		"towolf/vim-helm",
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require "robbie.plugins.treesitter"
			end,
		},
		{

			"hrsh7th/nvim-cmp",
			config = function()
				require "robbie.plugins.cmp"
			end,
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
		-- dev
		{
			"windwp/nvim-autopairs",
			config = function()
				require "robbie.plugins.autopairs"
			end,
		},
		"windwp/nvim-ts-autotag",
		{
			{
				"Yggdroot/indentLine",
				config = function()
					require "robbie.plugins.indent"
				end,
			},
			"mhinz/vim-signify",
			{
				"norcalli/nvim-colorizer.lua",
				config = function()
					require("colorizer").setup()
				end,
			},
			{
				"numToStr/Comment.nvim",
				config = function()
					require("Comment").setup()
				end,
			},
			{ "luisiacc/gruvbox-baby", branch = "main" },
		},
	},
	-- utilities
	{
		{
			"ThePrimeagen/harpoon",
			config = function()
				require("harpoon").setup {}
			end,
		},
		"dkarter/bullets.vim",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "kyazdani42/nvim-web-devicons", opt = true, name = "nvim-web-devicons2" },
			config = function()
				require "robbie.plugins.lualine"
			end,
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require "robbie.plugins.fzf-lua"
			end,
		},
		{
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
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
		{
			"preservim/vim-pencil",
			config = function()
				require "robbie.plugins.pencil"
			end,
		},
	},
}
