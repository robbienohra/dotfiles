local map = require('utils').map

-- lsp
map('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true } <CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- fugitive
map('n', '<Leader>gf', ':GBrowse<CR>')
map('n', '<Leader>gl', ':.GBrowse<CR>')

-- Clean search (highlight)
map('n', '<leader><space>', ':noh<cr>')

-- Window mode
map('n', '<Leader>w', '<C-w>')

-- Hard quit
map('n', '<Leader>q', ':qa!<CR>')

-- Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader>p', '"+gP<CR>')

-- editing
map('n', 'Q', 'ZQ')
map('n', '<leader>s', ':update<CR>')
map('i', '<C-s>', '<Esc>:update<CR>')
map('n', 'U', '<C-r>')

-- page up/down with centering
map('n', '<C-Down>', '<C-d>zz')
map('n', '<C-Up>', '<C-u>zz')

-- move snippets
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- d is for delete
-- https://github.com/pazams/d-is-for-delete
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('v', 'd', '"_d')
map('v', 'D', '"_D')

map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

map('n', '<leader>c', ':lua require(\'utils\').GetFileRelativePath()<CR>')

-- tabline
map('n', '<space>b', ':silent %bdelete|edit #|bdelete#<CR>')

map('n', 'tn', ':enew<CR>')
map('n', 'tk', ':lua require(\'utils\').CloseBufferOrQuit()<CR>')
map('n', 't<Left>', ':bprevious<CR>')
map('n', 't<Right>', ':bnext<CR>')

-- fzf-lua
map('n', '<leader>b', '<cmd>FzfLua buffers<cr>')
map('n', '<leader>t', '<cmd>FzfLua files<cr>')
map('n', '<leader>f', '<cmd>FzfLua grep_project<cr>')
map('n', '<leader>p', '<cmd>FzfLua oldfiles<cr>')
map('n', '<leader>y', '<cmd>FzfLua command_history<cr>')
map('n', '<leader>r', ':FzfLua resume<Space>', { silent = false })

-- terminal mappings
map('t', '<Esc>', '<C-\\><C-n>')
