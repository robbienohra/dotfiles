return {
	'ibhagwan/fzf-lua',
	-- optional for icon support
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('fzf-lua').setup {
			winopts = {
				preview = {
					layout = 'vertical',
				},
			},
			keymap = {
				fzf = {
					['ctrl-k'] = 'previous-history',
					['ctrl-j'] = 'next-history',
				},
			},

			fzf_opts = {
				['--layout'] = 'default',
			},
		}
	end,
}
