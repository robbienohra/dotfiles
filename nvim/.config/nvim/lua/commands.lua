local cmd = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd

cmd ":command! FixWhitespace :%s/s+$//e"

-- https://stackoverflow.com/questions/19430200/how-to-clear-vim-registers-effectively
cmd ":command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor"

-- https://codingshower.com/vim-set-tab-to-n-spaces/
autocmd("FileType", { pattern = { "*" }, command = "set noexpandtab shiftwidth=2 tabstop=2 softtabstop=2" })

autocmd(
  { "BufNewFile", "BufRead" },
  { pattern = { "*.yaml", "*.yml" }, command = "set expandtab" }
)
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
function! UpdateFile()
    lua vim.lsp.buf.format()
    update
endfunction
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

-- compile and run c++ script
autocmd("FileType", { pattern = { "cpp" }, command = "nnoremap <C-c> :!clang++ -o  %:r.out % -std=c++17<Enter>" })
autocmd("FileType", { pattern = { "cpp" }, command = "nnoremap <C-x> :!%:r.out<Enter>" })

-- compile and run TS script
autocmd("FileType", { pattern = { "typescript" }, command = "nnoremap <C-x> :!ts-node %<Enter>" })

-- override default python indentation
autocmd(
  { "BufNewFile", "BufRead" },
  { pattern = { "*.py" }, command = "set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent" }
)

-- https://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
autocmd({ "BufLeave" }, { pattern = { "*" }, command = "if &buftype == 'quickfix'|q|endif" })
autocmd({ "BufEnter" }, { pattern = { "*" }, command = "let &titlestring = ' ' . expand('%:t') | set title" })

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

-- markdown

autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, { pattern = { "*.md" }, command = "set syntax=markdown" })

-- pencil
autocmd("FileType", { pattern = { "markdown" }, command = "call pencil#init()" })
-- https://github.com/neovim/neovim/issues/6005#issuecomment-835825265
-- https://github.com/alacritty/alacritty/issues/5450#issuecomment-929797364
autocmd({ "ExitPre" }, { pattern = { "*" }, command = "set guicursor=a:ver90" })
