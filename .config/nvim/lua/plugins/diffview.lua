return {
	-- https://github.com/sindrets/diffview.nvim/blob/main/doc/diffview.txt#L1314
	'sindrets/diffview.nvim',
	config = function()
		local diffview = require 'diffview'
		require('diffview').setup {
			keymaps = {
				file_panel = {
					{ 'n', '<Leader>x', diffview.close },
				},
			},
		}
	end,
}
