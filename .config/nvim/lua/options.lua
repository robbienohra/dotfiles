vim.g.mapleader = ' '
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.netrw_banner = 0
local udir = os.getenv 'HOME' .. '/undodir'
local o = vim.opt
o.lazyredraw = true
o.backup = false
o.cursorcolumn = false
o.cursorline = true
o.relativenumber = false
o.swapfile = false
o.writebackup = false
o.number = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.undofile = true
o.cmdheight = 0
o.conceallevel = 2
o.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- https://neovim.io/doc/user/change.html#fo-table
o.regexpengine = 0
o.synmaxcol = 3000
o.shiftwidth = 2
o.timeoutlen = 300
o.ttimeoutlen = 0
o.undodir = udir
o.updatetime = 100
o.clipboard = { 'unnamed', 'unnamedplus' }

-- Searching
o.ignorecase = true
o.smartcase = true

-- Folding
-- https://neovim.io/doc/user/fold.html#[z
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldcolumn = '0'
o.foldtext = ''
o.foldlevel = 99
o.foldlevelstart = 1
o.foldnestmax = 4
o.incsearch = true

-- tabs
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

-- indentation
o.smartindent = false
o.autoindent = false
