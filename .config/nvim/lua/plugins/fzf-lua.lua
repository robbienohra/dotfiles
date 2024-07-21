local map = require('utils').map
return {
	'ibhagwan/fzf-lua',
	-- optional for icon support
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		keymap = {
			fzf = {
				['<c-e>'] = 'up',
				['<c-u>'] = 'down',
			},
		},
	},
	config = function()
		require('fzf-lua').setup {
			files = {
				actions = {
					['default'] = require('fzf-lua.actions').file_edit,
				},
			},
			winopts = {
				backdrop = 100,
				split = 'belowright new',
				preview = {
					layout = 'horizontal',
					hidden = 'hidden',
				},
			},
			keymap = {
				fzf = {
					['f4'] = 'toggle-preview',
				},
			},

			fzf_opts = {},
		}
		-- https://github.com/ibhagwan/fzf-lua/wiki/Advanced#fzf-exec-dir-switch
		local fzf = require 'fzf-lua'
		map('n', '<leader>t', fzf.files)
		map('n', '<leader>f', fzf.grep_project)
		map('n', '<leader>p', fzf.oldfiles)
		map('n', '<leader>y', fzf.command_history)
		map('n', '<leader>l', fzf.lines)
		map('n', '\\', fzf.buffers)
		map('n', '<leader>r', ':FzfLua resume<Space>', { silent = false })
	end,
}
