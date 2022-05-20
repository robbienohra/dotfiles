local cmd = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd

cmd ":command! FixWhitespace :%s/s+$//e"

-- https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
cmd [[command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*' ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)]]

cmd ":command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)"

-- https://github.com/junegunn/fzf.vim/issues/374#issuecomment-724301156
cmd [[command! -bang -nargs=* BLines call fzf#vim#grep('rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1, fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%')) "fzf#vim#with_preview({'options': '--layout reverse  --with-nth=-1.. --delimiter="/"'}, 'right:50%'))]]

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

-- disable auto-comment
-- https://neovim.io/doc/user/change.html#fo-table
-- autocmd("FileType *", { command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
