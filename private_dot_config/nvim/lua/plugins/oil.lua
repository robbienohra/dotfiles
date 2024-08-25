local map = require('utils').map

return {
	'stevearc/oil.nvim',
	opts = {},
	config = function()
		require('oil').setup {
			default_file_explorer = true,
			preview = {
				width = 0.9,
			},
			view_options = {
				show_hidden = true,
			},
		}
		map('n', '-', '<cmd>Oil<cr>')
	end,
}
