return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons', opt = true, name = 'nvim-web-devicons2' },
	config = function()
		require('lualine').setup {
			winbar = {
				lualine_a = {
					{
						'filename',
						file_status = true, -- Displays file status (readonly status, modified status)
						path = 1, -- 0: Just the filename
						-- shorting_target = 40, -- Shortens path to leave 40 spaces in the window
					},
				},
			},
			sections = {
				lualine_a = {
					{
						'mode',
						fmt = function(str)
							return str:sub(1, 1):lower()
						end,
					},
				},
				lualine_b = {
					{
						'branch',
						fmt = function(str)
							return str:sub(1, vim.o.columns * 1 / 8)
						end,
					},
				},
				lualine_x = { 'location' },
				lualine_y = { 'filetype' },
				lualine_z = { 'progress' },
			},
			options = {
				theme = 'gruvbox_dark',
				icons_enabled = true,
				fmt = string.lower,
			},
		}
	end,
}
