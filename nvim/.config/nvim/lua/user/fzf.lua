vim.g.fzf_preview_window = { "down:60%,hidden" }
vim.g.fzf_history_dir = "~/.local/share/fzf-history"
vim.g.fzf_layout = { window = { width = 0.90, height = 0.80, relative = true } }
vim.g.fzf_colors = { fg = { "fg", "Normal" }, bg = { "bg", "Normal" } }

-- local cmd = vim.api.nvim_command
--
-- cmd [[
-- function! RipgrepFzf(query, fullscreen)
--   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
--   let initial_command = printf(command_fmt, shellescape(a:query))
--   let reload_command = printf(command_fmt, '{q}')
--   let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
--   let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
--   call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
-- endfunction
--
-- command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
-- ]]
