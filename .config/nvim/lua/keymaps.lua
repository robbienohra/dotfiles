local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- lsp
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
map('n', '<Leader>gb', ':Gitsigns blame_line<CR>')
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

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<leader>p', '"+gP<CR>')

-- editing
map('n', 'ZZ', 'ZZ')
map('n', 'Q', 'ZQ')
map('n', '<leader>s', ':update<CR>')
map('i', '<C-s>', '<Esc>:update<CR>')
map('n', 'U', '<C-r>')

function GetBufferRelativePath(includeGitRootParent)
	local path = vim.fn.expand '%:p:h'
	local filename = vim.fn.expand '%:t'
	local handle = io.popen 'git rev-parse --show-toplevel 2> /dev/null'
	if not handle then
		return path
	end

	local git_root = handle:read('*a'):gsub('%s+$', '')
	handle:close()

	-- Check if git_root is a prefix of path and remove it
	local relative_path
	if path:sub(1, #git_root) == git_root then
		-- Plus 2 to remove the git_root and the following slash
		relative_path = path:sub(#git_root + 2)
	else
		relative_path = path
	end
	relative_path = relative_path .. '/' .. filename
	if includeGitRootParent then
		local parent_dir = git_root:match '^.+[/\\](.+)$'
		if parent_dir then
			relative_path = parent_dir .. '/' .. relative_path
		end
	end

	vim.fn.setreg('+', relative_path)

	return relative_path
end

map('n', '<C-Right>', '<C-w>w')
map('n', '<leader>cf', ':let @*=expand("%:t")<CR>')
map('n', '<leader>cp', ':lua GetBufferRelativePath()<CR>')

-- page up/down with centering
map('n', '<PageDown>', '<C-d>zz')
map('n', '<PageUp>', '<C-u>zz')
map('n', '<C-Down>', 'z.')

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

-- tabline

map('n', '<A-b>', ':silent %bdelete|edit #|bdelete#<CR>')

function CloseBufferOrQuit()
	local buf_count = vim.fn.len(vim.fn.getbufinfo { buflisted = true })
	if buf_count > 1 then
		vim.cmd 'bdelete'
	else
		-- If it's the last buffer, you can choose what to do:
		-- Option 1: Quit Neovim
		vim.cmd 'quit'

		-- Option 2: Open a default buffer (e.g., a start page or dashboard)
		-- vim.cmd 'Oil'
	end
end

map('n', 'tn', ':enew<CR>')
map('n', 'tk', ':lua CloseBufferOrQuit()<CR>')
map('n', 't<Left>', ':bprevious<CR>')
map('n', 't<Right>', ':bnext<CR>')

-- fzf-lua
-- map('n', '<leader>b', '<cmd>FzfLua blines<cr>')
map('n', '<leader>b', '<cmd>FzfLua buffers<cr>')
map('n', '<leader>t', '<cmd>FzfLua files<cr>')
map('n', '<leader>f', '<cmd>FzfLua grep_project<cr>')
map('n', '<leader>p', '<cmd>FzfLua oldfiles<cr>')
map('n', '<leader>y', '<cmd>FzfLua command_history<cr>')
