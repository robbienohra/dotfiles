vim.g.mapleader = ","
local udir = os.getenv("HOME").."/undodir"
local o = vim.opt
o.lz = true
o.bk =  false
o.cuc = false
o.cul = false
o.rnu = false
o.swf = false
o.wb = false
o.nu = true
o.sb = true
o.spr = true
o.tgc = true
o.udf = true
o.ch=1
o.cole=2
o.cot={'menuone', 'noinsert','noselect'}
o.fdm='marker'
o.formatoptions:append('l')
o.ls=2
o.re=0
o.shm='atW'
o.smc=200
o.sw=2
o.tm=1000
o.ttm=0
o.tw=79
o.udir=udir
o.ut=100
o.clipboard= { 'unnamed', 'unnamedplus' }
-- Searching
o.ic = true
o.scs = true