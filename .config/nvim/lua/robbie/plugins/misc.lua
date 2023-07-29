return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup {}
	end,
	{
		{
			"Yggdroot/indentLine",
			config = function()
				vim.g.indentLine_enabled = 1
				vim.g.indentLine_concealcursor = ''
				vim.g.indentLine_char = "┆"
				vim.g.indentLine_faster = 1
			end,
		},
		"mhinz/vim-signify",
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		},
		{
			"luisiacc/gruvbox-baby",
			branch = "main",
			config = function()
				local cmd = vim.cmd
				local autocmd = vim.api.nvim_create_autocmd
				vim.g.gruvbox_baby_highlights = { Visual = { bg = "#4c566a", fg = "#ffffff" } }
				cmd "colo gruvbox-baby"
				autocmd("FileType", { pattern = { "*" }, command = "highlight LineNr guifg=#665C54" })
				vim.opt.bg = "dark"
			end
		},
		{
			"dkarter/bullets.vim",
			config = function()
				vim.g.bullets_enabled_file_types = {
					"markdown",
					"text",
					"gitcommit",
					"scratch",
				}
			end
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"preservim/vim-pencil",
		config = function()
			vim.g.pencil = {
				textWidth = 80,
			}
		end,
	},
	"nvim-lua/plenary.nvim",
}
