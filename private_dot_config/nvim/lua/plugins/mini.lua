return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require('mini.icons').setup { use_cterm = true }
		require('mini.sessions').setup { autoread = true }
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
		require('mini.indentscope').setup {
			draw = { animation = require('mini.indentscope').gen_animation.none() },
			symbol = '┆',
			delay = 0,
			mappings = {
				object_scope = '',
				object_scope_with_border = '',
			},
		}
	end,
	dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring', 'echasnovski/mini.icons' },
}
