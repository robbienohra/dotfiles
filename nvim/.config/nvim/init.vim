lua require 'options'
lua require 'mappings'
lua require 'init'
lua require 'plugins'
lua require 'colorscheme'

highlight VertSplit cterm=NONE

"" Map leader to ,
let mapleader = ","

" vim-vinegar
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_winsize = 80

" nvim
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" markdown
let g:tex_conceal = "$"
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_conceal_code_blocks = 1
let g:vim_markdown_fenced_languages = ['js=javascript', 'c++=cpp']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_strikethrough = 1

" vim-svelte-plugin
let g:vim_svelte_plugin_load_full_syntax = 1
let g:vim_svelte_plugin_use_typescript = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" compile and run c++ program
autocmd FileType cpp nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
autocmd FileType cpp nnoremap <C-x> :!./%:r.out

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

" override default python indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" commenter
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml,sh setlocal commentstring=#\ %s
autocmd FileType markdown,vue setlocal commentstring=<!--\ %s\ -->
