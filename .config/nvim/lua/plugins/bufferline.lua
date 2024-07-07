return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		vim.opt.termguicolors = true
		vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = '#181825' })
		require('bufferline').setup {
			options = {
				indicator = {
					style = 'underline',
				},
			},
		}
	end,
}
