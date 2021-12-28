" files
set ic 
  \ nobk
  \ nowb
  \ udf
  \ nu
  \ lz
  \ nornu 
  \ nocuc
  \ nocul
  \ spr
  \ sb
  \ tgc " needed for colorizer
set udir=~/.configs/nvim/undodir
set ls=2
set tw=79
set ch=1
set fo+=l
set shm=atW
set sw=2
set ut=100
set smc=200
set fdm=marker
set re=0
set tm=1000 ttm=0
set cot=menuone,noinsert,noselect
set cole=2
highlight VertSplit cterm=NONE

filetype plugin indent on

" plugins

call plug#begin('~/.vim/plugged')
Plug 'ellisonleao/gruvbox.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'rktjmp/lush.nvim'
Plug 'ruanyl/vim-gh-line'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}
Plug 'sainnhe/gruvbox-material'
call plug#end()

" theme
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_invert_selection=0
" let g:gruvbox_italic = 1
" let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
set bg=dark " must be set after plugins
colo gruvbox-material


" nvim
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" plugin configs

" signify

nnoremap <leader>gd :SignifyDiff<cr>

" fzf

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" coc-nvim 
let g:coc_global_extensions = [
		\"coc-clangd", 
		\"coc-css", 
		\"coc-emmet",
		\"coc-html",
		\"coc-json", 
		\"coc-prettier",
		\"coc-sh",
		\"coc-pyright", 
		\"coc-sql", 
		\"coc-tsserver",
		\"coc-eslint",
		\"coc-yaml",
		\"coc-toml",
		\"coc-markdownlint",
		\"coc-snippets",
		\"coc-pairs",
		\"coc-vetur"]

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66

" commenter
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml,sh setlocal commentstring=#\ %s
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,            
    additional_vim_regex_highlighting = false,
  },
}
EOF

" lualine
lua <<EOF
require('lualine').setup {
  options = {
    theme = 'gruvbox_dark',
    icons_enabled = false
  }
}
EOF

" colorizer
lua <<EOF
require'colorizer'.setup()
EOF

" mappings

" fzf

nnoremap <silent> <C-t> :Files <CR>
nnoremap <silent> <C-f> :Rg<CR>

" fugitive

map <leader>dv :Gvdiffsplit!

" coc-nvim

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nnoremap <silent> <leader>p :Prettier<CR>
imap <C-l> <Plug>(coc-snippets-expand)

" compile and run c++ program

autocmd FileType cpp nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
autocmd FileType cpp nnoremap <C-x> :!./%:r.out

" find and replace

map <leader>f :%s/

" editing

nnoremap ZZ ZZ
nnoremap Q ZQ
" save when not in insert mode
nnoremap <silent> <C-S> :update<CR>
" save when in insert mode
inoremap <silent> <C-S> <Esc>:update<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
" break a line in normal mode
nnoremap <NL> i<CR><CR><up><ESC>
" insert date header
nmap <silent> <leader>D "=strftime('# %Y-%m-%d')<C-M>p

" clear search
noremap <silent> <C-k> :let @/ = ""<CR>

" black hole register
nmap <S-d> "_dd
nmap <S-b> dvb
nmap <S-w> diw

" override default python indentation

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

