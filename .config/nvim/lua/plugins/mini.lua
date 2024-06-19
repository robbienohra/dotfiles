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
		require('mini.indentscope').setup {
			draw = { animation = require('mini.indentscope').gen_animation.none() },
			symbol = '┆',
			delay = 0,
			mappings = {
				object_scope = '',
				object_scope_with_border = '',
			},
		}
		require('mini.starter').setup {}
		-- https://github.com/echasnovski/mini.nvim/issues/427
		local session = require 'mini.sessions'
		session.setup { autowrite = false }
		local autowrite = function()
			local session_name
			if vim.v.this_session == '' then
				session_name = 'Session.vim'
			end
			session.write(session_name, { force = true })
		end
		vim.api.nvim_create_autocmd('VimLeavePre', { callback = autowrite, desc = 'Autowrite session' })
	end,
	dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
}
