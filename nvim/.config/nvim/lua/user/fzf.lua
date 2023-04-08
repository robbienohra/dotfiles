vim.g.fzf_preview_window = { "down:50%" }
vim.g.fzf_history_dir = "~/.local/share/fzf-history"
vim.g.fzf_layout = { window = { width = 0.90, height = 0.80, relative = true } }
vim.g.fzf_colors = { fg = { "fg", "Normal" }, bg = { "bg", "Normal" } }

local cmd = vim.api.nvim_command

-- https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
cmd(
  [[command! -bang -nargs=* Rg call ]]
    .. [[ fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*' ".shellescape(<q-args>), 1,]]
    .. [[ fzf#vim#with_preview({'options': []}), <bang>0)
]]
)

-- https://github.com/junegunn/fzf.vim/issues/374#issuecomment-724301156
cmd(
  [[command! -bang -nargs=* BLines call ]]
    .. [[fzf#vim#grep(]]
    .. [['rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')),]]
    .. [[ 1,]]
    .. [[fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4..'}, 'up:60%'),]]
    .. [[0)
]]
)
