return {
	'echasnovski/mini.nvim',
	version = '*',
	disabled = true,
	config = function()
		require('mini.comment').setup {
			pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
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
	opts = {
		hooks = {
			pre = function()
				print 'Successfully calling pre hook function...'
				require('ts_context_commentstring.internal').update_commentstring()
			end,
		},
	},
}
