"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

set ic
  \ lz
  \ nobk
  \ nocuc
  \ nocul
  \ nornu
  \ noswf
  \ nowb
  \ nu
  \ sb
  \ spr
  \ tgc
  \ udf
set ch=1
set cole=2
set cot=menuone,noinsert,noselect
set fdm=marker
set fo+=l
set ls=2
set re=0
set shm=atW
set smc=200
set sw=2
set tm=1000 ttm=0
set tw=79
set udir=~/.configs/nvim/undodir
set ut=100
highlight VertSplit cterm=NONE

filetype plugin indent on

" Required
call plug#begin('~/.vim/plugged')

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'Yggdroot/indentLine'
Plug 'antoinemadec/coc-fzf'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'plasticboy/vim-markdown'
Plug 'rktjmp/lush.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'reedes/vim-pencil'
call plug#end()

" theme
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection=0
let g:gruvbox_italic = 1
let g:gruvbox_sign_column = 'bg0'
set bg=dark " must be set after plugins
colo gruvbox

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

" coc-nvim
let g:coc_global_extensions = [
		\"coc-clangd",
		\"coc-cmake",
		\"coc-css",
		\"coc-emmet",
		\"coc-eslint",
		\"coc-go",
		\"coc-html",
		\"coc-json",
		\"coc-markdownlint",
		\"coc-pairs",
		\"coc-prettier",
		\"coc-pyright",
		\"coc-rust-analyzer",
		\"coc-sh",
		\"coc-snippets",
		\"coc-sql",
		\"coc-svelte",
		\"coc-toml",
		\"coc-tsserver",
		\"coc-vimtex",
		\"coc-yaml",
		\"@yaegassy/coc-volar"]

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

let g:fzf_preview_window = ['down:50%']

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" fzf
nnoremap <silent> <C-t> :GFiles <CR>
nnoremap <silent> <C-f> :Rg<CR>
nmap <leader>y :History:<CR>
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>
nnoremap <Leader>o :.GBrowse<CR>

"" coc-nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>rn <Plug>(coc-rename)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nnoremap <silent> <leader>p :Prettier<CR>
nnoremap <silent><nowait> <space>d :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
imap <C-l> <Plug>(coc-snippets-expand)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" compile and run c++ program
autocmd FileType cpp nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
autocmd FileType cpp nnoremap <C-x> :!./%:r.out

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

nnoremap ZZ ZZ
nnoremap Q ZQ
nnoremap <silent> <C-S> :update<CR>
noremap <silent> <F4> :let @+=expand("%")<CR>
noremap <silent> <F9> :exec 'source '.bufname('%')<CR>
map <esc> :noh <CR>
nnoremap <NL> i<CR><CR><up><ESC>
nmap <silent> <leader>D "=strftime('# %Y-%m-%d')<C-M>p
nmap <S-d> "_dd
nmap <S-b> dvb
nmap <S-w> diw
map <leader>f :%s/
inoremap <silent> <C-S> <Esc>:update<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
nnoremap <leader>. :lcd %:p:h<CR>
" noremap <silent> <F4> :let @+=expand("%:p")<CR>

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

" override default python indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" commenter
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml,sh setlocal commentstring=#\ %s
autocmd FileType markdown,vue setlocal commentstring=<!--\ %s\ -->

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"*****************************************************************************
"" Lua configs 
"*****************************************************************************
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('lualine').setup {
  options = {
    theme = 'gruvbox_dark',
    icons_enabled = true
  }
}

require'colorizer'.setup()

require('Comment').setup()
EOF
