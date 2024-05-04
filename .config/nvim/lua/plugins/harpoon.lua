return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local harpoon = require 'harpoon'
		harpoon:setup {
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		}
		vim.keymap.set('n', '<leader>a', function()
			harpoon:list():add()
		end)

		vim.keymap.set('n', '<leader>o', function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
}
