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
	end,
	keys = {
		{ '-', '<cmd>Oil<cr>' },
	},
}
