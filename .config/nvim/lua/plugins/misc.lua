return {
	{
		{
			'Yggdroot/indentLine',
			config = function()
				vim.g.indentLine_enabled = 1
				vim.g.indentLine_concealcursor = ''
				vim.g.indentLine_char = '┆'
				vim.g.indentLine_faster = 1
			end,
		},
		{
			'lewis6991/gitsigns.nvim',
			config = function()
				require('gitsigns').setup {
					update_debounce = 500,
				}
			end,
		},
		{
			'numToStr/Comment.nvim',
			config = function()
				require('Comment').setup()
			end,
		},
		{
			'catppuccin/nvim',
			name = 'catppuccin',
			priority = 1000,
			config = function()
				require('catppuccin').setup {
					flavour = 'mocha',
				}

				vim.cmd 'colorscheme catppuccin'
			end,
		},
		{
			'dkarter/bullets.vim',
			config = function()
				vim.g.bullets_outline_levels = { 'std-' }
				vim.g.bullets_enabled_file_types = {
					'markdown',
					'text',
					'gitcommit',
					'scratch',
				}
			end,
		},
	},
	'nvim-lua/plenary.nvim',
	{
		'iamcco/markdown-preview.nvim',
		ft = 'markdown',
	},
}
