local cmd = vim.cmd
cmd("highlight VertSplit cterm=NONE")

-- compile and run c++ program
cmd("au FileType cpp nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>")
cmd("au FileType cpp nnoremap <C-x> :!./%:r.out")

-- override default python indentation
cmd("au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent")

-- disable auto-comment
cmd("au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

cmd(":command! FixWhitespace :%s/s+$//e")

-- https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
cmd([[command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)]])
cmd(":command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)")
