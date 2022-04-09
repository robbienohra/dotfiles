local cmd = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd

cmd("highlight VertSplit cterm=NONE")

cmd(":command! FixWhitespace :%s/s+$//e")

-- https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
cmd(
  [[command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)]]
)
cmd(":command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)")

-- compile and run c++ program
autocmd("FileType cpp", { command = "nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>" })
autocmd("FileType cpp", { command = "nnoremap <C-x> :!./%:r.out" })

-- override default python indentation
autocmd(
  "BufNewFile,BufRead *.py",
  { command = "set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent" }
)

-- disable auto-comment
autocmd("FileType *", { command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
