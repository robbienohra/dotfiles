local utils = require 'utils'
local map = utils.map

map('n', 'l', 'u') -- remap undo
map('v', ']', 'e') -- remap end of word

-- navigation
-- cursor movement
-- https://github.com/theniceboy/nvim/blob/master/init.vim
map({ 'n', 'v' }, 'k', 'i')
map({ 'n', 'v' }, 'K', 'I')
map({ 'n', 'v' }, 'U', '5k')
map({ 'n', 'v' }, 'E', '5j')
map('n', 'N', '0')
map('n', 'W', '5w')
map('n', 'B', '5b')

-- colemak adjustments
--     ^
--     u
-- < n   i >
--     e
--     v
map({ 'n', 'v' }, 'u', 'k')
map({ 'n', 'v' }, 'n', 'h')
map({ 'n', 'v' }, 'e', 'j')
map({ 'n', 'v' }, 'i', 'l')

-- page up/down with centering
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-e>', '<C-d>zz')

-- Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
map('n', '<cr>', 'nzzzv')
map('n', 'S', 'Nzzzv')

-- buffers
map('n', '<Leader>w', '<C-w>')
map('n', '<Leader>u', '<C-w>k')
map('n', '<Leader>e', '<C-w>j')
map('n', '<Leader>n', '<C-w>h')
map('n', '<Leader>i', '<C-w>l')

map('n', '<leader>sh', vim.cmd.split)
map('n', '<leader>sv', vim.cmd.vsplit)

map('n', '<Leader><cr>', vim.cmd.nohlsearch)
map('n', '<Leader>s', vim.cmd.update)
-- map('n', '<Leader>x', '<cmd>%bd<cr>')
map('n', '<leader>x', function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end)

-- quit
map('n', '<Leader>q', vim.cmd.quit)
map('n', '<leader>qa', function()
	vim.cmd 'qa'
end)
map('n', 'q', vim.cmd.bdelete)
map('n', '<Leader>Q', function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_delete(bufnr, { force = true })
end)
map('n', '<Tab>', vim.cmd.bnext)
map('n', '<S-Tab>', vim.cmd.bprevious)

-- editing

-- d is for delete
-- https://github.com/pazams/d-is-for-delete
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('v', 'd', '"_d')
map('v', 'D', '"_D')

map('n', '<Leader>c', utils.GetFileRelativePath)

-- terminal
map('n', '<C-\\>', ':vsplit term://nu<CR>')

-- lsp
map('n', ',a', vim.lsp.buf.code_action)
map('n', ',h', vim.lsp.buf.hover)
map('n', ',m', vim.lsp.buf.rename)
map('n', ',r', vim.lsp.buf.references)
map('n', ',s', vim.lsp.buf.document_symbol)
map('n', ',d', vim.diagnostic.open_float)

-- git remote set-head -a origin
map('n', '<leader>v', function()
	vim.cmd 'DiffviewOpen origin/HEAD...HEAD --imply-local'
end)

-- terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')
