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
o.wb = false
o.nu = true
o.sb = true
o.spr = true
o.tgc = true
o.udf = true
o.ch = 1
o.cole = 2
o.cot = { "menuone", "noinsert", "noselect" }
o.fdm = "marker"
-- https://neovim.io/doc/user/change.html#fo-table
o.formatoptions:append("l")
o.ls = 2
o.re = 0
o.shortmess = "atW"
o.smc = 200
o.sw = 2
o.tm = 1000
o.ttm = 0
o.tw = 79
o.udir = udir
o.ut = 100
o.clipboard = { "unnamed", "unnamedplus" }
-- Searching
o.ic = true
o.scs = true
-- Folding
o.foldlevel = 20
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
