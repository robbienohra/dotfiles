local cmd = vim.cmd
cmd("highlight VertSplit cterm=NONE")

-- compile and run c++ program
cmd("au FileType cpp nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>")
cmd("au FileType cpp nnoremap <C-x> :!./%:r.out")

-- override default python indentation
cmd("au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent")

-- disable auto-comment
cmd("au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")