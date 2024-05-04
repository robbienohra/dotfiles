return {
	{
		{
			'lukas-reineke/indent-blankline.nvim',
			main = 'ibl',
			config = function()
				require('ibl').setup {
					indent = { char = '┆' },
					scope = {
						enabled = false,
					},
				}
			end,
		},
		{
			'lewis6991/gitsigns.nvim',
			config = function()
				require('gitsigns').setup {
					update_debounce = 100,
					on_attach = function(bufnr)
						local gs = package.loaded.gitsigns

						local function map(mode, l, r, opts)
							opts = opts or {}
							opts.buffer = bufnr
							vim.keymap.set(mode, l, r, opts)
						end

						-- Navigation
						map('n', ']c', function()
							if vim.wo.diff then
								return ']c'
							end
							vim.schedule(function()
								gs.next_hunk()
							end)
							return '<Ignore>'
						end, { expr = true })

						map('n', '[c', function()
							if vim.wo.diff then
								return '[c'
							end
							vim.schedule(function()
								gs.prev_hunk()
							end)
							return '<Ignore>'
						end, { expr = true })

						-- Actions
						map('n', '<leader>hs', gs.stage_buffer)
						map('n', '<leader>hr', gs.reset_buffer)
						map('n', '<leader>hp', gs.preview_hunk)
						map('n', '<leader>hd', gs.diffthis)
						map('n', '<leader>hb', function()
							gs.blame_line { full = true }
						end)
						vim.cmd 'redrawstatus'
					end,
				}
			end,
		},
		{
			'numToStr/Comment.nvim',
			config = function()
				require('Comment').setup()
			end,
		},
		{
			'catppuccin/nvim',
			name = 'catppuccin',
			priority = 1000,
			config = function()
				require('catppuccin').setup {
					flavour = 'mocha',
					color_overrides = {
						mocha = {
							base = '#181825', -- mantle
						},
					},
				}

				vim.cmd 'colorscheme catppuccin'
			end,
		},
		{
			'dkarter/bullets.vim',
			config = function()
				vim.g.bullets_outline_levels = { 'std-' }
				vim.g.bullets_enabled_file_types = {
					'markdown',
					'text',
					'gitcommit',
					'scratch',
				}
			end,
		},
	},
	'nvim-lua/plenary.nvim',
}
