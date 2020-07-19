call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/indentpython.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'


Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'gosukiwi/vim-atom-dark'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_theme='gruvbox'
syntax on

let g:gruvbox_contrast_dark = 'hard'

set foldmethod=indent
set foldlevel=99

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}

set encoding=utf-8


"set background=dark
let mapleader = "<space>"

set relativenumber


colorscheme nord

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

let g:flake8_cmd=expand("C:\Users\Manuel\AppData\Local\nvim\Python\nvim\Scripts\flake8.exe")


let g:python3_host_prog = expand('C:\Users\Manuel\AppData\Local\nvim\Python\nvim\Scripts\python.exe')



" Linting -----------------------------------------

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

nmap <F6> :NERDTreeToggle<CR>

" Coc ----------------------------------------


set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



set statusline^=%{coc#status()}
