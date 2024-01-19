return {
	'rebelot/heirline.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'catppuccin/nvim',
		'lewis6991/gitsigns.nvim',
	},

	config = function()
		local utils = require 'heirline.utils'
		local tabline = require 'plugins.heirline.components.tabline'
		local c = require 'plugins.heirline.components.base'
		local u = require 'plugins.heirline.components.utils'

		-- local clrs = require('catppuccin.palettes').get_palette()

		local colors = {
			bright_bg = utils.get_highlight('Folded').bg,
			bright_fg = utils.get_highlight('Folded').fg,
			red = utils.get_highlight('DiagnosticError').fg,
			dark_red = utils.get_highlight('DiffDelete').bg,
			green = utils.get_highlight('String').fg,
			blue = utils.get_highlight('Function').fg,
			gray = utils.get_highlight('NonText').fg,
			orange = utils.get_highlight('Constant').fg,
			purple = utils.get_highlight('Statement').fg,
			cyan = utils.get_highlight('Special').fg,
			black = utils.get_highlight('Directory').fg,
			diag_warn = utils.get_highlight('DiagnosticWarn').fg,
			diag_error = utils.get_highlight('DiagnosticError').fg,
			diag_hint = utils.get_highlight('DiagnosticHint').fg,
			diag_info = utils.get_highlight('DiagnosticInfo').fg,
			git_del = utils.get_highlight('diffRemoved').fg,
			git_add = utils.get_highlight('diffAdded').fg,
			git_change = utils.get_highlight('diffChanged').fg,
		}

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
			utils.surround({ '', '' }, 'bright_bg', FileNameBlock),
		}

		local Ruler = {
			provider = '%7(%l/%3L%):%2c %P',
			hl = { fg = 'black' },
		}

		Ruler = utils.surround({ '', '' }, 'bright_bg', Ruler)

		require('heirline').setup {
			opts = {
				colors = colors,
			},
			winbar = { WinBars },
			statusline = { ViMode, u.space, c.cwd, u.space, c.git, u.align, Ruler },
			tabline = { tabline },
		}

		vim.o.showtabline = 2
		vim.cmd [[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]]
	end,
}
