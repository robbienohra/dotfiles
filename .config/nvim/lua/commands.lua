local autocmd = vim.api.nvim_create_autocmd

-- https://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
autocmd({ 'BufLeave' }, { pattern = { '*' }, command = 'if &buftype == \'quickfix\'|q|endif' })
autocmd({ 'BufEnter' }, { pattern = { '*' }, command = 'let &titlestring = \' \' . expand(\'%:t\') | set title' })

-- https://github.com/neovim/neovim/issues/6005#issuecomment-835825265
-- https://github.com/alacritty/alacritty/issues/5450#issuecomment-929797364
vim.api.nvim_create_autocmd('ExitPre', {
	group = vim.api.nvim_create_augroup('Exit', { clear = true }),
	command = 'set guicursor=a:ver90',
	desc = 'Set cursor back to beam when leaving Neovim.',
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = 'justfile',
	command = 'setf make',
})
