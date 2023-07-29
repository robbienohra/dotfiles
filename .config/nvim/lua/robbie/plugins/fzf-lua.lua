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

			fzf_opts = {
				['--layout'] = 'default',
			},
		}
	end,
}
