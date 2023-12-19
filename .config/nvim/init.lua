require 'robbie.options'
require 'robbie.nvim'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	}
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup {
	defaults = { lazy = false },
	spec = {
		{
			{ import = 'robbie.plugins' },
		},
	},
	performance = {
		rtp = {
			reset = true,
			disabled_plugins = {
				'gzip',
				'matchit',
				'matchparen',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
			},
		},
	},
}

require 'robbie.commands'
require 'robbie.keymaps'
