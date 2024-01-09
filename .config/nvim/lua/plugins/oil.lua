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
		}
	end,
}
