return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('oil').setup {
			preview = {
				width = 0.9,
			},
		}
	end,
	keys = {
		{ '-', '<cmd>Oil<cr>' },
	},
}
