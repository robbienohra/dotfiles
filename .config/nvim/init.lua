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

-- TODO: switch directories
-- https://github.com/ibhagwan/fzf-lua/wiki/Advanced#example-directory-switcher

_G.fzf_dirs = function(opts)
	local fzf_lua = require 'fzf-lua'
	opts = opts or {}
	opts.prompt = 'Directories> '
	opts.fn_transform = function(x)
		return fzf_lua.utils.ansi_codes.magenta(x)
	end
	opts.actions = {
		['default'] = function(selected)
			vim.cmd('Oil ' .. selected[1])
		end,
	}
	fzf_lua.fzf_exec('fd --type d', opts)
end

-- vim.keymap.set('n', '<C-k>', _G.fzf_dirs)
vim.keymap.set('n', '<C-k>', '<cmd>lua _G.fzf_dirs()<CR>')
