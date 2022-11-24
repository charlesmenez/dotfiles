set number
set relativenumber
set autoindent
filetype plugin indent on
syntax on
set t_Co=256
set expandtab
set splitbelow splitright
colorscheme twilight256

map <C-s> <Esc>:w<CR>
map <C-n> <Esc>:vsplit<CR>

call plug#begin()
 Plug 'mcchrish/nnn.vim'
 Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
 Plug 'ryanoasis/vim-devicons'
 Plug 'alvan/vim-closetag'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'Yggdroot/indentLine'
 Plug 'jiangmiao/auto-pairs'
 Plug 'luochen1990/rainbow'
 Plug 'ap/vim-css-color'
 Plug 'rafi/awesome-vim-colorschemes'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'nvim-lua/completion-nvim'
 Plug 'sheerun/vim-polyglot'
 Plug 'airblade/vim-gitgutter'
call plug#end()

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

map <C-f> <Esc>:CHADopen<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


