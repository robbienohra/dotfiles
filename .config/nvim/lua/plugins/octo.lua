return {
	'pwntester/octo.nvim',
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
