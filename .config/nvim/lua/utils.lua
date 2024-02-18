local M = {}

function M.GetFileRelativePath()
	local path = vim.fn.expand '%:p:h' -- Get the directory path of the current buffer
	local filename = vim.fn.expand '%:t' -- Get the filename of the current buffer
	local handle = io.popen 'git rev-parse --show-toplevel 2> /dev/null'
	if not handle then
		return path .. '/' .. filename -- Return the path with the filename if the handle is nil
	end

	local git_root = handle:read('*a'):gsub('%s+$', '')
	handle:close()

	-- Check if git_root is a prefix of path and remove it
	local relative_path
	if path == git_root then
		-- If the file is at the root, return just the filename
		relative_path = filename
	elseif path:sub(1, #git_root) == git_root then
		-- If the file is not at the root, remove the git_root and the following slash, then append the filename
		relative_path = path:sub(#git_root + 2) .. '/' .. filename
	else
		relative_path = path .. '/' .. filename
	end

	vim.fn.setreg('+', relative_path)
end

function M.CloseBufferOrQuit()
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

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


return M
