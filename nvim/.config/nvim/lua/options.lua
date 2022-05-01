vim.g.mapleader = ","
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
local udir = os.getenv("HOME") .. "/undodir"
local o = vim.opt
o.lazyredraw = true
o.backup = false
o.cursorcolumn = false
o.cursorline = false
o.relativenumber = false
o.swapfile = false
o.writebackup = false
o.number = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.undofile = true
o.cmdheight = 1
o.conceallevel = 2
o.completeopt = { "menuone", "noinsert", "noselect" }
o.foldmethod = "marker"
-- https://neovim.io/doc/user/change.html#fo-table
o.formatoptions:append("l")
o.laststatus = 2
o.regexpengine = 0
o.shortmess = "atW"
o.synmaxcol = 200
o.shiftwidth = 2
o.timeoutlen = 1000
o.ttimeoutlen = 0
o.textwidth = 79
o.undodir = udir
o.updatetime = 100
o.clipboard = { "unnamed", "unnamedplus" }
-- Searching
o.ignorecase = true
o.smartcase = true
-- Folding
o.foldlevel = 20
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
