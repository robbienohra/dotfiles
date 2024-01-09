return {
	'ibhagwan/fzf-lua',
	-- optional for icon support
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('fzf-lua').setup {
			winopts = {
				height = '0.5',
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

			fzf_opts = {
				['--layout'] = 'default',
			},
		}
	end,
}
