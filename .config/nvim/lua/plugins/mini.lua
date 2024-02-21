return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.sessions').setup {
			-- Whether to read latest session if Neovim opened without file arguments
			autoread = false,

			-- Whether to write current session before quitting Neovim
			autowrite = true,

			-- File for local session (use `''` to disable)
			file = 'Session.vim',

			-- Whether to force possibly harmful actions (meaning depends on function)
			force = { read = false, write = true, delete = false },

			-- Hook functions for actions. Default `nil` means 'do nothing'.
			hooks = {
				-- Before successful action
				pre = { read = nil, write = nil, delete = nil },
				-- After successful action
				post = { read = nil, write = nil, delete = nil },
			},

			-- Whether to print session path after action
			verbose = { read = true, write = true, delete = true },
		}
	end,
}
