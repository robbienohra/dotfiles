return {
	'ibhagwan/fzf-lua',
	-- optional for icon support
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('fzf-lua').setup {
			files = {
				actions = {
					['default'] = require('fzf-lua.actions').file_edit,
				},
			},
			winopts = {
				split = 'belowright new',
				preview = {
					layout = 'vertical',
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
	end,
}
