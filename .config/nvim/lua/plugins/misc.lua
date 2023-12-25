return {
	{
		{
			'lukas-reineke/indent-blankline.nvim',
			main = 'ibl',
			opts = {},
			config = function()
				require('ibl').setup {
					indent = { char = '┆' },
				}
			end,
		},
		{
			'lewis6991/gitsigns.nvim',
			config = function()
				require('gitsigns').setup {}
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
