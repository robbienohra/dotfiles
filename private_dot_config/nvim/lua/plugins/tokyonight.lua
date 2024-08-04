return {
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require('tokyonight').setup {
			style = 'moon',
			on_colors = function(colors)
				colors.bg_statusline = colors.bg
			end,
		}
		vim.cmd [[colorscheme tokyonight]]
	end,
}
