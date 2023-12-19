return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	config = function()
		require('harpoon').setup {}
	end,
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
			'luisiacc/gruvbox-baby',
			branch = 'main',
			config = function()
				local cmd = vim.cmd
				local autocmd = vim.api.nvim_create_autocmd
				vim.g.gruvbox_baby_highlights = { Visual = { bg = '#4c566a', fg = '#ffffff' } }
				cmd 'colo gruvbox-baby'
				autocmd('FileType', { pattern = { '*' }, command = 'highlight LineNr guifg=#665C54' })
				vim.opt.bg = 'dark'
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
	{
		'preservim/vim-pencil',
		config = function()
			vim.g.pencil = {
				textWidth = 80,
			}
		end,
	},
	'nvim-lua/plenary.nvim',
	{
		'iamcco/markdown-preview.nvim',
		ft = 'markdown',
	},
}
