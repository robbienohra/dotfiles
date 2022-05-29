local cmd = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd

cmd ":command! FixWhitespace :%s/s+$//e"

-- https://vim.fandom.com/wiki/Invoke_a_function_with_a_count_prefix
vim.api.nvim_exec(
  [[
function! Cline(count)
  execute a:count
  execute "normal zz"
endfunction
command! -nargs=1 ClineCmd call Cline(<args>)
map ,a :<C-U>ClineCmd(v:count)<CR>
]],
  true
)

vim.api.nvim_exec(
  [[
function! Dline(count)
  execute a:count
  execute "normal dd"
endfunction
command! -nargs=1 DlineCmd call Dline(<args>)
map ,d :<C-U>DlineCmd(v:count)<CR>
]],
  true
)

-- https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
cmd [[command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*' ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --preview-window bottom:50% --nth 4..'}), <bang>0)]]

cmd ":command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)"

-- https://github.com/junegunn/fzf.vim/issues/374#issuecomment-724301156
cmd [[command! -bang -nargs=* BLines call fzf#vim#grep('rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1, fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'down:50%')) "fzf#vim#with_preview({'options': '--layout reverse  --with-nth=-1.. --delimiter="/"'}, 'down:50%'))]]

-- compile and run c++ program
autocmd("FileType", { pattern = { "cpp" }, command = "nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>" })
autocmd("FileType", { pattern = { "cpp" }, command = "nnoremap <C-x> :!./%:r.out<Enter>" })

-- override default python indentation
autocmd(
  { "BufNewFile", "BufRead" },
  { pattern = { "*.py" }, command = "set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent" }
)

autocmd({ "BufLeave" }, { pattern = { "*" }, command = "if &buftype == 'quickfix'|q|endif" })

autocmd({ "BufEnter" }, { pattern = { "*" }, command = "let &titlestring = ' ' . expand('%:t') | set title" })

-- autocmd({ "ColorScheme" }, { pattern = { "*" }, command = "hi Normal guibg=none | hi NoneText guibg=none" })

-- disable auto-comment
-- https://neovim.io/doc/user/change.html#fo-table
-- autocmd("FileType *", { command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
-- https://www.reddit.com/r/neovim/comments/3v06lo/making_the_background_transparent/
vim.api.nvim_exec(
  [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
  ]],
  true
)
