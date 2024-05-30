local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'

function GetBufferRelativePath()
	local path = vim.fn.expand '%:p:h' -- Get the directory path of the current buffer
	local filename = vim.fn.expand '%:t' -- Get the filename of the current buffer
	local handle = io.popen 'git rev-parse --show-toplevel 2> /dev/null'
	if not handle then
		return path .. '/' .. filename -- Return the path with the filename if the handle is nil
	end

	local git_root = handle:read('*a'):gsub('%s+$', '')
	handle:close()

	-- Check if git_root is a prefix of path and remove it
	local relative_path
	if path == git_root then
		-- If the file is at the root, return just the filename
		relative_path = filename
	elseif path:sub(1, #git_root) == git_root then
		-- If the file is not at the root, remove the git_root and the following slash, then append the filename
		relative_path = path:sub(#git_root + 2) .. '/' .. filename
	else
		relative_path = path .. '/' .. filename
	end

	if not conditions.width_percent_below(#relative_path, 0.75) then
		relative_path = vim.fn.pathshorten(relative_path)
	end

	return relative_path
end

-- path: /Users/robbienohra/socotra-configuration/config
-- git_root: /Users/robbienohra/socotra-configuration

local M = {
	vi_mode = {
		init = function(self)
			self.mode = vim.fn.mode(1)
		end,
		static = {
			mode_names = {
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
			return '%2(' .. self.mode_names[self.mode] .. '%) '
		end,
		hl = function(self)
			local mode = self.mode:sub(1, 1) -- get only the first mode character
			return { fg = self.mode_colors[mode], bold = true }
		end,
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
			return GetBufferRelativePath()
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

		{
			provider = function(self)
				return ' '
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
	diagnostics = {
		{
			condition = conditions.has_diagnostics,
			init = function(self)
				local buffer_diagnostics = vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.INFO } })
				local diagnostic_counts = { 0, 0, 0, 0 }
				for _, d in ipairs(buffer_diagnostics) do
					diagnostic_counts[d.severity] = diagnostic_counts[d.severity] + 1
				end
				local children = {}
				for d, count in pairs(diagnostic_counts) do
					if count > 0 then
						table.insert(children, {
							provider = self.icons[d] .. ' ' .. count,
							hl = self.highlights[d],
						})
					end
				end
				for i = 1, #children - 1, 1 do
					table.insert(children[i], { provider = ' ' })
				end
				self.child = self:new(children, 1)
			end,
			static = {
				icons = {
					'', -- close
					'󰈅', -- exclamation
					'i', -- info
					'󰌵', -- lightbulb
				},
				highlights = {
					'DiagnosticError',
					'DiagnosticWarn',
					'DiagnosticInfo',
					'DiagnosticHint',
				},
			},
			on_click = {
				callback = function()
					require('trouble').toggle { mode = 'document_diagnostics' }
				end,
				name = 'heirline_diagnostics',
			},
			provider = function(self)
				return self.child:eval()
			end,
		},
		update = { 'DiagnosticChanged', 'BufEnter' },
	},
}

return M
