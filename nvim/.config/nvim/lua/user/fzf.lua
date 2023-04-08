vim.g.fzf_preview_window = { "down:hidden" }
vim.g.fzf_history_dir = "~/.local/share/fzf-history"
vim.g.fzf_layout = { window = { width = 0.90, height = 0.80, relative = true } }
vim.g.fzf_colors = { fg = { "fg", "Normal" }, bg = { "bg", "Normal" } }

local cmd = vim.api.nvim_command

-- https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
cmd(
  [[command! -bang -nargs=* Rg call ]]
    .. [[fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*' ".shellescape(<q-args>),]]
    .. [[1,]]
    .. [[fzf#vim#with_preview({'options': []}, 'down:60%'),]]
    .. [[<bang>0)
]]
)
