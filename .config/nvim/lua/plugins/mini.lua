return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require('mini.surround').setup {}
		require('mini.comment').setup {
			options = {
				custom_commentstring = function()
					return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
				end,
			},
			mappings = {
				comment_line = 'gc',
			},
		}
	end,
	dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
}
