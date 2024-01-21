return {
	'rebelot/heirline.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'catppuccin/nvim',
		'lewis6991/gitsigns.nvim',
	},

	config = function()
		local utils = require 'heirline.utils'
		local conditions = require 'heirline.conditions'
		local colors = require 'plugins.heirline.components.colors'
		local tabline = require 'plugins.heirline.components.tabline'
		local c = require 'plugins.heirline.components.base'
		local u = require 'plugins.heirline.components.utils'

		local FileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}

		local FileNameModifer = {
			hl = function()
				if vim.bo.modified then
					return { fg = 'cyan', bold = true, force = true }
				end
			end,
		}

		FileNameBlock = utils.insert(FileNameBlock, utils.insert(FileNameModifer, c.filename), u.space, { provider = '%<' })

		ViMode = utils.surround({ '', '' }, 'bright_bg', { c.vi_mode })

		local WinBars = {
			u.align,
			c.git,
		}

		local Ruler = {
			provider = '%7(%l/%3L%):%2c %P',
			hl = { fg = 'black' },
		}

		Ruler = utils.surround({ '', '' }, 'bright_bg', Ruler)

		local StatusLine = {
			ViMode,
			u.space,
			c.cwd,
			u.align,
			Ruler,
		}

		local SpecialStatusline = {
			condition = function()
				return conditions.buffer_matches {
					buftype = { 'nofile', 'prompt', 'help', 'quickfix', 'term' },
					filetype = { '^git.*', 'fugitive', 'oil' },
				}
			end,
			u.align,
		}

		local StatusLines = {

			fallthrough = false,

			SpecialStatusline,
			StatusLine,
		}

		require('heirline').setup {
			opts = {
				colors = colors,
			},
			winbar = { WinBars },
			statusline = StatusLines,
			tabline = { tabline },
		}

		vim.o.showtabline = 2
		vim.cmd [[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]]
	end,
}
