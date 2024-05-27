local map = require('utils').map

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

-- buffers
map('n', '<leader>w', '<C-w>w')
map('n', '<leader>u', '<C-w>k')
map('n', '<leader>e', '<C-w>j')
map('n', '<leader>n', '<C-w>h')
map('n', '<leader>i', '<C-w>l')

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

-- Clean search (highlight)
map('n', '<leader><cr>', ':nohlsearch<CR>')

-- Hard quit
map('n', '<leader>q', ':qa!<CR>')

-- editing
map('n', 'Q', 'ZQ')
map('n', '<leader>s', ':update<CR>')

-- Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
map('n', 's', 'nzzzv')
map('n', 'S', 'Nzzzv')

map('n', '<leader>c', ':lua require(\'utils\').GetFileRelativePath()<CR>')

-- oil
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- terminal
map('n', '<C-\\>', ':vsplit term://nu<CR>')

-- lsp
map('n', ',f', function()
	vim.lsp.buf.format { async = true }
end)
map('n', ',a', vim.lsp.buf.code_action)
map('n', ',h', vim.lsp.buf.hover)
map('n', ',m', vim.lsp.buf.rename)
map('n', ',r', vim.lsp.buf.references)
map('n', ',s', vim.lsp.buf.document_symbol)
map('n', ',d', vim.diagnostic.open_float)

-- fugitive
map('n', '<leader>gm', ':.GBrowse main:%<CR>')
map('n', '<leader>gf', ':GBrowse<CR>')
map('n', '<leader>gl', ':.GBrowse<CR>')
map('n', '<leader>ga', ':Gwrite<CR>')
map('n', '<leader>gA', ':Gwrite!<CR>')
map('n', '<leader>gd', ':Gdelete<CR>')


-- Tab management
map('n', 'tu', ':enew<CR>')
map('n', 'tn', ':bprevious<CR>')
map('n', 'ti', ':bnext<CR>')
map('n', 'T', ':bdelete!<CR>') -- needed for terminal buffers
map('n', 'tk', ':lua require(\'utils\').CloseBufferOrQuit()<CR>')
-- map('n', '<space>b', ':silent %bdelete|edit #|bdelete#<CR>')

-- fzf-lua
map('n', '<leader>t', '<cmd>FzfLua files<cr>')
map('n', '<leader>f', '<cmd>FzfLua grep_project<cr>')
map('n', '<leader>p', '<cmd>FzfLua oldfiles<cr>')

map('n', '<leader>y', '<cmd>FzfLua command_history<cr>')
map('n', '<leader>r', ':FzfLua resume<Space>', { silent = false })
map('n', '<leader>l', '<cmd>FzfLua lines<cr>')

-- https://github.com/ibhagwan/fzf-lua/wiki/Advanced#fzf-exec-dir-switch

-- terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')

-- telescope
map('n', '<space><space>', '<Cmd>Trouble<CR>', { silent = false })

-- diffview
-- map('n', '<leader>d', ':DiffviewOpen<space>', { silent = false })
-- map('n', '<leader>x', ':DiffviewClose<CR>', { silent = false })

-- move snippets
-- map('v', 'J', ':m \'>+1<CR>gv=gv')
-- map('v', 'K', ':m \'<-2<CR>gv=gv')
