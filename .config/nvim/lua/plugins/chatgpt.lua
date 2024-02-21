return {
	'jackMort/ChatGPT.nvim',
	event = 'VeryLazy',
	config = function()
		require('chatgpt').setup {
			openai_params = {
				model = 'gpt-4',
			},
			keymaps = {
				toggle_sessions = '<C-s>',
			},
		}
	end,
	dependencies = {
		'MunifTanjim/nui.nvim',
		'nvim-lua/plenary.nvim',
		'folke/trouble.nvim',
		'nvim-telescope/telescope.nvim',
	},
}
