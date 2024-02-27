local map = require('utils').map

-- search
map('n', 's', 'n')
map('n', 'S', 'N')

-- Cursor movement
-- https://github.com/theniceboy/nvim/blob/master/init.vim
map('n', 'l', 'u')
map({ 'n', 'v' }, 'k', 'i')
map({ 'n', 'v' }, 'K', 'I')
map({ 'n', 'v' }, 'U', '5k')
map({ 'n', 'v' }, 'E', '5j')
map('n', 'N', '0')
map('n', 'W', '5w')
map('n', 'B', '5b')

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
map('n', '<leader>w', '<C-w>w')
map('n', '<leader>u', '<C-w>k')
map('n', '<leader>e', '<C-w>j')
map('n', '<leader>n', '<C-w>h')
map('n', '<leader>i', '<C-w>l')

map('n', '<C-u>', '<C-u>zz')
map('n', '<C-e>', '<C-d>zz')
map('n', '<leader>w', '<C-w>w')

-- terminal
map('n', '<C-\\>', ':vsplit term://nu<CR>')

-- lsp
map('n', ',f', '<cmd>lua vim.lsp.buf.format { async = true } <CR>')
map('n', ',a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
map('n', ',h', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', ',m', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', ',r', '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', ',s', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
map('n', ',e', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- fugitive
map('n', '<leader>gf', ':GBrowse<CR>')
map('n', '<leader>gl', ':.GBrowse<CR>')

-- Clean search (highlight)
map('n', '<leader><cr>', ':nohlsearch<CR>')

-- Hard quit
map('n', '<leader>q', ':qa!<CR>')

-- Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
-- map('n', 'f', 'nzzzv')
-- map('n', 'F', 'Nzzzv')

map('n', '<leader>p', '"+gP<CR>')

-- editing
map('n', 'Q', 'ZQ')
map('n', '<leader>s', ':update<CR>')
-- map('i', '<C-s>', '<Esc>:update<CR>')

-- move snippets
-- map('v', 'J', ':m \'>+1<CR>gv=gv')
-- map('v', 'K', ':m \'<-2<CR>gv=gv')

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

map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

map('n', '<leader>c', ':lua require(\'utils\').GetFileRelativePath()<CR>')

-- Tab management
map('n', '<space>b', ':silent %bdelete|edit #|bdelete#<CR>')

map('n', 'tu', ':enew<CR>')
map('n', 'tn', ':bprevious<CR>')
map('n', 'ti', ':bnext<CR>')
map('n', 'T', ':bdelete!<CR>')
map('n', 'tk', ':lua require(\'utils\').CloseBufferOrQuit()<CR>')

-- fzf-lua
map('n', '<leader>t', '<cmd>FzfLua files<cr>')
map('n', '<leader>f', '<cmd>FzfLua grep_project<cr>')
map('n', '<leader>p', '<cmd>FzfLua oldfiles<cr>')

map('n', '<leader>y', '<cmd>FzfLua command_history<cr>')
map('n', '<leader>r', ':FzfLua resume<Space>', { silent = false })
map('n', '<leader>b', '<cmd>FzfLua buffers<cr>')

-- https://github.com/ibhagwan/fzf-lua/wiki/Advanced#fzf-exec-dir-switch

_G.fzf_dirs = function(opts)
	local fzf_lua = require 'fzf-lua'
	opts = opts or {}
	opts.prompt = 'Directories> '
	opts.fn_transform = function(x)
		return fzf_lua.utils.ansi_codes.magenta(x)
	end
	opts.actions = {
		['default'] = function(selected)
			vim.cmd('Oil ' .. selected[1])
		end,
	}
	fzf_lua.fzf_exec('fd -H --type d', opts)
end

vim.keymap.set('n', '<leader>k', _G.fzf_dirs)

-- terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')
