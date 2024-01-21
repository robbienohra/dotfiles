local utils = require 'heirline.utils'
local file_icon = require('plugins.heirline.components.base').file_icon

local TablineBufnr = {
	provider = function(self)
		return tostring(self.bufnr) .. '. '
	end,
	hl = 'Comment',
}

local TablineFileName = {
	provider = function(self)
		local filename = self.filename
		filename = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t')
		return filename
	end,
	hl = function(self)
		return { bold = self.is_active or self.is_visible, italic = true }
	end,
}

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

local TablineFileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(self.bufnr)
	end,
	hl = function(self)
		if self.is_active then
			return 'TabLineSel'
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
	file_icon,
	TablineFileName,
	TablineFileFlags,
}

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

			-- -- check how many buffers we have and set showtabline accordingly
			-- if #buflist_cache > 1 then
			-- 	vim.o.showtabline = 2 -- always
			-- elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
			-- 	vim.o.showtabline = 1 -- only when #tabpages > 1
			-- end
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

return TabLine
