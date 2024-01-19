local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'
local M = {
	vi_mode = {
		init = function(self)
			self.mode = vim.fn.mode(1) -- :h mode()
		end,
		static = {
			mode_names = { -- change the strings if you like it vvvvverbose!
				n = 'N',
				no = 'N?',
				nov = 'N?',
				noV = 'N?',
				['no\22'] = 'N?',
				niI = 'Ni',
				niR = 'Nr',
				niV = 'Nv',
				nt = 'Nt',
				v = 'V',
				vs = 'Vs',
				V = 'V_',
				Vs = 'Vs',
				['\22'] = '^V',
				['\22s'] = '^V',
				s = 'S',
				S = 'S_',
				['\19'] = '^S',
				i = 'I',
				ic = 'Ic',
				ix = 'Ix',
				R = 'R',
				Rc = 'Rc',
				Rx = 'Rx',
				Rv = 'Rv',
				Rvc = 'Rv',
				Rvx = 'Rv',
				c = 'C',
				cv = 'Ex',
				r = '...',
				rm = 'M',
				['r?'] = '?',
				['!'] = '!',
				t = 'T',
			},
			mode_colors = {
				n = 'red',
				i = 'green',
				v = 'cyan',
				V = 'cyan',
				['\22'] = 'cyan',
				c = 'orange',
				s = 'purple',
				S = 'purple',
				['\19'] = 'purple',
				R = 'orange',
				r = 'orange',
				['!'] = 'red',
				t = 'red',
			},
		},
		provider = function(self)
			return ' %2(' .. self.mode_names[self.mode] .. '%)'
		end,
		-- Same goes for the highlight. Now the foreground will change according to the current mode.
		hl = function(self)
			local mode = self.mode:sub(1, 1) -- get only the first mode character
			return { fg = self.mode_colors[mode], bold = true }
		end,
		-- Re-evaluate the component only on ModeChanged event!
		-- Also allows the statusline to be re-evaluated when entering operator-pending mode
		update = {
			'ModeChanged',
			pattern = '*:*',
			callback = vim.schedule_wrap(function()
				vim.cmd 'redrawstatus'
			end),
		},
	},
	cwd = {
		provider = function()
			local icon = (vim.fn.haslocaldir(0) == 1 and 'l' or 'g') .. ' ' .. ' '
			local cwd = vim.fn.getcwd(0)
			cwd = vim.fn.fnamemodify(cwd, ':~')
			if not conditions.width_percent_below(#cwd, 0.50) then
				cwd = vim.fn.pathshorten(cwd)
			end
			local trail = cwd:sub(-1) == '/' and '' or '/'
			return icon .. cwd .. trail
		end,
		hl = { fg = 'blue', bold = true },
	},
	git = {
		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
		end,
		condition = conditions.is_git_repo,

		hl = { fg = 'orange' },

		{ -- git branch name
			provider = function(self)
				return ' ' .. self.status_dict.head
			end,
			hl = { bold = true },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = '(',
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ('+' .. count)
			end,
			hl = { fg = 'git_add' },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ('-' .. count)
			end,
			hl = { fg = 'git_del' },
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ('~' .. count)
			end,
			hl = { fg = 'git_change' },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = ')',
		},
	},
	filename = {
		provider = function(self)
			local filename = vim.fn.fnamemodify(self.filename, ':.')
			if filename == '' then
				return '[No Name]'
			end
			if not conditions.width_percent_below(#filename, 0.5) then
				filename = vim.fn.pathshorten(filename)
			end
			return filename
		end,
		hl = { fg = utils.get_highlight('Directory').fg },
	},
	file_icon = {
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ':e')
			self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
		end,
		provider = function(self)
			return self.icon and (self.icon .. ' ')
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end,
	},
	file_flags = {
		{
			condition = function()
				return vim.bo.modified
			end,
			provider = '[+]',
			hl = { fg = 'green' },
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			provider = '',
			hl = { fg = 'orange' },
		},
	},
}
return M
