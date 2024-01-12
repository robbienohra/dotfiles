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

		local Align = { provider = '%=', hl = { fg = 'black' } }
		local Space = { provider = ' ', hl = { fg = 'black' } }

		local FileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}

		local FileIcon = {
			init = function(self)
				local filename = self.filename
				local extension = vim.fn.fnamemodify(filename, ':e')
				self.icon, self.icon_color =
					require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
			end,
			provider = function(self)
				return self.icon and (self.icon .. ' ')
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local FileName = {
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
		}

		local FileFlags = {
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
		}

		local FileNameModifer = {
			hl = function()
				if vim.bo.modified then
					-- use `force` because we need to override the child's hl foreground
					return { fg = 'cyan', bold = true, force = true }
				end
			end,
		}

		FileNameBlock = utils.insert(
			FileNameBlock,
			FileIcon,
			utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
			Space,
			FileFlags,
			{ provider = '%<' } -- this means that the statusline is cut here when there's not enough space
		)

		local ViMode = {
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
		}

		local Git = {

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
		}
		local WorkDir = {
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
		}

		ViMode = utils.surround({ '', '' }, 'bright_bg', { ViMode })
		local WinBars = {
			Align, utils.surround({ '', '' }, 'bright_bg', FileNameBlock),
		}

		local Ruler = {
			-- %l = current line number
			-- %L = number of lines in the buffer
			-- %c = column number
			-- %P = percentage through file of displayed window
			provider = '%7(%l/%3L%):%2c %P',
			hl = { fg = 'black' },
		}

		Ruler = utils.surround({ '', '' }, 'bright_bg', Ruler)

		-- tabline

		local TablineBufnr = {
			provider = function(self)
				return tostring(self.bufnr) .. '. '
			end,
			hl = 'Comment',
		}

		-- we redefine the filename component, as we probably only want the tail and not the relative path
		local TablineFileName = {
			provider = function(self)
				-- self.filename will be defined later, just keep looking at the example!
				local filename = self.filename
				filename = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t')
				return filename
			end,
			hl = function(self)
				return { bold = self.is_active or self.is_visible, italic = true }
			end,
		}

		-- this looks exactly like the FileFlags component that we saw in
		-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
		-- also, we are adding a nice icon for terminal buffers.
		local TablineFileFlags = {
			{
				condition = function(self)
					return vim.api.nvim_buf_get_option(self.bufnr, 'modified')
				end,
				provider = '[+]',
				hl = { fg = 'green' },
			},
			{
				condition = function(self)
					return not vim.api.nvim_buf_get_option(self.bufnr, 'modifiable')
						or vim.api.nvim_buf_get_option(self.bufnr, 'readonly')
				end,
				provider = function(self)
					if vim.api.nvim_buf_get_option(self.bufnr, 'buftype') == 'terminal' then
						return '  '
					else
						return ''
					end
				end,
				hl = { fg = 'orange' },
			},
		}

		-- Here the filename block finally comes together
		local TablineFileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(self.bufnr)
			end,
			hl = function(self)
				if self.is_active then
					return 'TabLineSel'
					-- why not?
					-- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
					--     return { fg = "gray" }
				else
					return 'TabLine'
				end
			end,
			on_click = {
				callback = function(_, minwid, _, button)
					if button == 'm' then -- close on mouse middle click
						vim.schedule(function()
							vim.api.nvim_buf_delete(minwid, { force = false })
						end)
					else
						vim.api.nvim_win_set_buf(0, minwid)
					end
				end,
				minwid = function(self)
					return self.bufnr
				end,
				name = 'heirline_tabline_buffer_callback',
			},
			TablineBufnr,
			FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
			TablineFileName,
			TablineFileFlags,
		}

		-- a nice "x" button to close the buffer
		local TablineCloseButton = {
			condition = function(self)
				return not vim.api.nvim_buf_get_option(self.bufnr, 'modified')
			end,
			{ provider = ' ' },
			{
				provider = '✗',
				hl = { fg = 'gray' },
				on_click = {
					callback = function(_, minwid)
						vim.schedule(function()
							vim.api.nvim_buf_delete(minwid, { force = false })
							vim.cmd.redrawtabline()
						end)
					end,
					minwid = function(self)
						return self.bufnr
					end,
					name = 'heirline_tabline_close_buffer_callback',
				},
			},
		}

		-- The final touch!
		local TablineBufferBlock = utils.surround({ '', '' }, function(self)
			if self.is_active then
				return utils.get_highlight('TabLineSel').bg
			else
				return utils.get_highlight('TabLine').bg
			end
		end, { TablineFileNameBlock, TablineCloseButton })

		-- this is the default function used to retrieve buffers
		local get_bufs = function()
			return vim.tbl_filter(function(bufnr)
				return vim.api.nvim_buf_get_option(bufnr, 'buflisted')
			end, vim.api.nvim_list_bufs())
		end

		-- initialize the buflist cache
		local buflist_cache = {}

		-- setup an autocmd that updates the buflist_cache every time that buffers are added/removed
		vim.api.nvim_create_autocmd({ 'VimEnter', 'UIEnter', 'BufAdd', 'BufDelete' }, {
			callback = function()
				vim.schedule(function()
					local buffers = get_bufs()
					for i, v in ipairs(buffers) do
						buflist_cache[i] = v
					end
					for i = #buffers + 1, #buflist_cache do
						buflist_cache[i] = nil
					end

					-- check how many buffers we have and set showtabline accordingly
					if #buflist_cache > 1 then
						vim.o.showtabline = 2 -- always
					elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
						vim.o.showtabline = 1 -- only when #tabpages > 1
					end
				end)
			end,
		})

		local BufferLine = utils.make_buflist(
			TablineBufferBlock,
			{ provider = ' ', hl = { fg = 'gray' } },
			{ provider = ' ', hl = { fg = 'gray' } },
			-- out buf_func simply returns the buflist_cache
			function()
				return buflist_cache
			end,
			-- no cache, as we're handling everything ourselves
			false
		)

		vim.keymap.set('n', 'gbp', function()
			local tabline = require('heirline').tabline
			local buflist = tabline._buflist[1]
			buflist._picker_labels = {}
			buflist._show_picker = true
			vim.cmd.redrawtabline()
			local char = vim.fn.getcharstr()
			local bufnr = buflist._picker_labels[char]
			if bufnr then
				vim.api.nvim_win_set_buf(0, bufnr)
			end
			buflist._show_picker = false
			vim.cmd.redrawtabline()
		end)
		local Tabpage = {
			provider = function(self)
				return '%' .. self.tabnr .. 'T ' .. self.tabpage .. ' %T'
			end,
			hl = function(self)
				if not self.is_active then
					return 'TabLine'
				else
					return 'TabLineSel'
				end
			end,
		}

		local TabpageClose = {
			provider = '%999X ✗ %X',
			hl = 'TabLine',
		}

		local TabPages = {
			-- only show this component if there's 2 or more tabpages
			condition = function()
				return #vim.api.nvim_list_tabpages() >= 2
			end,
			{ provider = '%=' },
			utils.make_tablist(Tabpage),
			TabpageClose,
		}
		local TabLineOffset = {
			condition = function(self)
				local win = vim.api.nvim_tabpage_list_wins(0)[1]
				local bufnr = vim.api.nvim_win_get_buf(win)
				self.winid = win

				if vim.bo[bufnr].filetype == 'NvimTree' then
					self.title = 'NvimTree'
					return true
					-- elseif vim.bo[bufnr].filetype == "TagBar" then
					--     ...
				end
			end,

			provider = function(self)
				local title = self.title
				local width = vim.api.nvim_win_get_width(self.winid)
				local pad = math.ceil((width - #title) / 2)
				return string.rep(' ', pad) .. title .. string.rep(' ', pad)
			end,

			hl = function(self)
				if vim.api.nvim_get_current_win() == self.winid then
					return 'TablineSel'
				else
					return 'Tabline'
				end
			end,
		}
		local TabLine = { TabLineOffset, BufferLine, TabPages }
		require('heirline').setup {
			opts = {
				colors = colors,
			},
			winbar = { WinBars },
			statusline = { ViMode, Space, WorkDir, Space, Git, Align, Ruler },
			tabline = { TabLine },
		}

		-- Yep, with heirline we're driving manual!
		vim.o.showtabline = 2
		vim.cmd [[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]]
	end,
}
