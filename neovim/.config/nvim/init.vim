set nocompatible
set ignorecase
set nobackup
set nowritebackup
set encoding=UTF-8
set number
set undodir=~/.configs/nvim/undodir
set undofile
set ls=2
set termguicolors
set textwidth=79
set cmdheight=1
set formatoptions+=l
set shm=at
set shortmess+=W
set shiftwidth=2
set updatetime=300
set norelativenumber
set lazyredraw
set nocursorcolumn
set nocursorline
set synmaxcol=200
set foldmethod=marker
set re=0
set timeoutlen=1000 ttimeoutlen=0
set completeopt=menuone,noinsert,noselect
set pastetoggle=<F3>
" for cursor focus
set splitright
set splitbelow

filetype plugin indent on
filetype on
highlight VertSplit cterm=NONE

" plugins

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'robbienohra/nord-vim/'
Plug 'hoob3rt/lualine.nvim'
Plug 'mhinz/vim-signify'
Plug 'ruanyl/vim-gh-line'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'plasticboy/vim-markdown'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" themes

let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
colorscheme nord

" markdown

let g:vim_markdown_strikethrough = 1
let g:vim_markdown_conceal_code_blocks = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 1
set conceallevel=2

" coc-nvim 

let g:coc_global_extensions = [
		\"coc-clangd", 
		\"coc-css", 
		\"coc-emmet",
		\"coc-html",
		\"coc-json", 
		\"coc-prettier", 
		\"coc-pyright", 
		\"coc-sql", 
		\"coc-tsserver",
		\"coc-eslint",
		\"coc-yaml",
		\"coc-toml"]

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

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66

" python indentation

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" fzf

nnoremap <silent> <C-t> :Files <CR>
nnoremap <silent> <C-f> :Rg<CR>

" mappings

" compile and run c++ program

autocmd FileType cpp nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
autocmd FileType cpp nnoremap <C-x> :!./%:r.out

" find and replace

map <leader>f :%s/

" create file if it does not exist

noremap <leader>gf :e <cfile><cr>

nnoremap tl  :tabprev<CR>
nnoremap tu  :tabnext<CR>

autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1

nnoremap ZZ ZZ
nnoremap Q ZQ
nnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc>:update<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>

nmap <S-d> "_dd
nmap <S-b> dvb
nmap <S-w> ciw

" nvim

let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" lua configs

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,            
    disable = { "c", "rust" }, 
    additional_vim_regex_highlighting = false,
  },
}

require('lualine').setup {
  options = {
    theme = 'nord'
  }
}

require'colorizer'.setup()
EOF

" abbreviations

func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

autocmd FileType cpp iabbrev <buffer> ns using namespace std;<CR>Eatchar('\s')<CR>
autocmd FileType cpp iabbrev <buffer> main <buffer> int main<CR>Eatchar('\s')<CR>
autocmd FileType typescriptreact,typescript iabbrev <buffer> cl console.log(<C-R>=Eatchar('\s')<CR>
iabbrev <expr> dts strftime("%Y-%m-%d")
