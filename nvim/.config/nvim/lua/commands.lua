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

-- compile and run c++ script
autocmd("FileType", { pattern = { "cpp" }, command = "nnoremap <C-c> :!clang++ -o  %:r.out % -std=c++11<Enter>" })
autocmd("FileType", { pattern = { "cpp" }, command = "nnoremap <C-x> :!./%:r.out<Enter>" })

-- compile and run TS script
autocmd("FileType", { pattern = { "typescript" }, command = "nnoremap <C-x> :!ts-node %<Enter>" })

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
-- https://www.reddit.com/r/neovim/comments/3v06lo/making_the_background_transparent/
vim.api.nvim_exec(
  [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
  ]],
  true
)
