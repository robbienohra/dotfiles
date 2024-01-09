return {
	'ibhagwan/fzf-lua',
	-- optional for icon support
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('fzf-lua').setup {
			winopts = {
				split = 'belowright new',
				preview = {
					layout = 'vertical',
					hidden = 'hidden',
				},
			},
			keymap = {
				fzf = {
					['ctrl-k'] = 'previous-history',
					['ctrl-j'] = 'next-history',
					['f4'] = 'toggle-preview',
				},
			},

			fzf_opts = {},
		}
	end,
}
