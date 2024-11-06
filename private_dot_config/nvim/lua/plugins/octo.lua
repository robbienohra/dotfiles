return {
	'pwntester/octo.nvim',
	enabled = true,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'ibhagwan/fzf-lua',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('octo').setup {
			picker = 'fzf-lua',
		}
	end,
}
