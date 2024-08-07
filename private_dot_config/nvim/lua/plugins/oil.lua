local map = require('utils').map

return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('oil').setup {
			default_file_explorer = false,
			preview = {
				width = 0.9,
			},
			view_options = {
				show_hidden = true,
			},
		}
		map('-', '<cmd>Oil<cr>')
	end,
}
