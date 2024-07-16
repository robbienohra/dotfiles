return {
	-- https://github.com/sindrets/diffview.nvim/blob/main/doc/diffview.txt#L1314
	'sindrets/diffview.nvim',
	config = function()
		local diffview = require 'diffview'
		require('diffview').setup {
			view = {
				default = {
					-- layout = 'diff2_vertical',
					layout = 'diff2_horizontal',
				},
			},
			keymaps = {
				file_panel = {
					{ 'n', '<Leader>x', diffview.close },
				},
				view = {
					{ 'n', '<Leader>x', diffview.close },
				},
			},
		}
	end,
}
