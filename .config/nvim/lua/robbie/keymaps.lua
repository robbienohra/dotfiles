local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_exec(
	[[
function! GetRelativePath()
  let l:git_root = systemlist('git rev-parse --show-toplevel')[0]
  let l:file_path = expand('%:p')
  let l:relative_path = substitute(l:file_path, l:git_root.'/', '', '')
  return l:relative_path
endfunction
]],
	true
)

map('n', '<leader>c', ':let @+=GetRelativePath()<CR>')

-- lsp
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true } <CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<space>d', '<cmd>lua vim.diagnostic.disable()<CR>')

-- git
map('n', '<Leader>ga', ':Gwrite<CR>')
map('n', '<Leader>gc', ':G commit --verbose<CR>')
map('n', '<Leader>gp', ':G push<CR>')
map('n', '<Leader>gl', ':G pull<CR>')
map('n', '<Leader>gs', ':G<CR>')
map('n', '<Leader>gb', ':G blame<CR>')
map('n', '<Leader>gd', ':Gvdiffsplit! main...head <CR>')
map('n', '<Leader>gr', ':GDelete<CR>')
map('n', '<Leader>ge', ':.GBrowse<CR>')
map('n', '<Leader>gf', ':GBrowse<CR>')
map('n', '<Leader>gt', ':G tag<CR>')

-- Set working directory
map('n', '<leader>.', ':lcd %:p:h<CR>')

-- Clean search (highlight)
map('n', '<leader><space>', ':noh<cr>')

-- Window mode
map('n', '<Leader>w', '<C-w>')

-- Hard quit
map('n', '<Leader>q', ':qa!<CR>')
map('n', '-', ':q!<CR>')

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader>p', '"+gP<CR>')

-- editing
map('n', 'ZZ', 'ZZ')
map('n', 'Q', 'ZQ')
map('n', '<leader>s', ':update<CR>')
map('n', 'U', '<C-r>')
map('n', '<S-d>', '_dd')
map('n', '<S-b>', 'dvb')
map('n', '<S-w>', 'diw')
map('n', '<Leader>o', 'o<Esc>^Da')

map('n', '<C-Right>', '<C-w>w')

-- page up/down with centering
map('n', '<PageDown>', '<C-d>zz')
map('n', '<PageUp>', '<C-u>zz')
map('n', '<C-Down>', 'z.')

-- reattach
-- map("n", "<Leader>r", ":e <CR>")

-- yank filename
-- map("n", "<leader>c", ":let @+=expand('%')<CR>")

-- move snippets
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- harpoon
map('n', '<leader>h', ':lua require(\'harpoon.mark\').add_file()<CR>')
map('n', '<esc>h', ':lua require(\'harpoon.ui\').toggle_quick_menu()<CR>')

-- pencil
map('n', '<F7>', ':<C-u>PFormatToggle<cr>')
map('i', '<F7>', '<C-o>:PFormatToggle<cr>')
