local autocmd = vim.api.nvim_create_autocmd

-- https://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
-- https://www.reddit.com/r/neovim/comments/1datzv6/here_is_the_command_to_close_the_quickfix_menu/
autocmd({ 'BufLeave' }, { pattern = { '*' }, command = 'if &buftype == \'quickfix\'|q|endif' })
autocmd({ 'BufEnter' }, { pattern = { '*' }, command = 'let &titlestring = \' \' . expand(\'%:t\') | set title' })

-- https://www.reddit.com/r/neovim/comments/1bis4h3/comment/kvmfjka
autocmd('FileType', {
	pattern = { 'markdown', 'gitcommit' },
	callback = function()
		vim.opt_local.formatoptions:append 'r' -- `<CR>` in insert mode
		vim.opt_local.formatoptions:append 'o' -- `o` in normal mode
		vim.opt_local.comments = {
			'b:- [ ]', -- tasks
			'b:- [x]',
			'b:*', -- unordered list
			'b:-',
			'b:+',
		}
	end,
})

-- https://github.com/neovim/neovim/issues/6005#issuecomment-835825265
-- https://github.com/alacritty/alacritty/issues/5450#issuecomment-929797364
autocmd('ExitPre', {
	group = vim.api.nvim_create_augroup('Exit', { clear = true }),
	command = 'set guicursor=a:ver90',
	desc = 'Set cursor back to beam when leaving Neovim.',
})

autocmd({ 'BufNewFile', 'BufEnter' }, {
	pattern = 'justfile',
	command = 'setf make',
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function(args)
		require('conform').format { bufnr = args.buf }
	end,
})
