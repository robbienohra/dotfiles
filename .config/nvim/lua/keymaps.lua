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
map('n', '<Leader>w', '<C-w>w')
map('n', '<Leader>u', '<C-w>k')
map('n', '<Leader>e', '<C-w>j')
map('n', '<Leader>n', '<C-w>h')
map('n', '<Leader>i', '<C-w>l')

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

map('n', '<Leader><cr>', ':nohlsearch<CR>')
map('n', '<Leader>s', ':update<CR>')
map('n', '<Leader>x', ':bdelete<CR>') -- needed for terminal buffers

-- Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
map('n', 's', 'nzzzv')
map('n', 'S', 'Nzzzv')

map('n', '<Leader>c', ':lua require(\'utils\').GetFileRelativePath()<CR>')

-- oil
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- terminal
map('n', '<C-\\>', ':vsplit term://nu<CR>')

-- lsp
map('n', ',a', vim.lsp.buf.code_action)
map('n', ',h', vim.lsp.buf.hover)
map('n', ',m', vim.lsp.buf.rename)
map('n', ',r', vim.lsp.buf.references)
map('n', ',s', vim.lsp.buf.document_symbol)
map('n', ',d', vim.diagnostic.open_float)

-- terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')

-- telescope
map('n', '<space><space>', '<Cmd>Trouble<CR>', { silent = false })

-- fugitive
map('n', '<Leader>gm', ':.GBrowse main:%<CR>')
map('n', '<Leader>gf', ':GBrowse<CR>')
map('n', '<Leader>gl', ':.GBrowse<CR>')
map('n', '<Leader>ga', ':Gwrite<CR>')
map('n', '<Leader>gA', ':Gwrite!<CR>')
map('n', '<Leader>gd', ':Gdelete<CR>')

map('n', '<Leader>v', ':DiffviewOpen', { silent = false })
-- move snippets
-- map('v', 'J', ':m \'>+1<CR>gv=gv')
-- map('v', 'K', ':m \'<-2<CR>gv=gv')
