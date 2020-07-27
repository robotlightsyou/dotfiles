 "https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/init.vim"

"add fuzzy search :find *
set path+=**

syntax on
filetype plugin on

"Display all matching files when we tab complete
set wildmenu

set noerrorbells
set tabstop=4 softtabstop=4
set expandtab "convert tab to space?"
set smartindent
set undodir=~/.vim/undodir
set undofile
set shiftwidth=4
set rnu " shows active line number amid relative numbers"
set number relativenumber
set nowrap
set smartcase "affects searching"
set noswapfile
set incsearch
"add no highlight to search

"sets pythonv version?
set pyxversion=3

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" give more space for displaying messages "
set cmdheight=2

"shorten update time to avoid errors/improve experience"
set updatetime=50

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-fugitive'
"Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', {'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
"Plug 'markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 
"                            \ 'for': ['markdown', 'vim-plug']}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()

let g:airline_solarized_bg='dark'
let g:airline_theme='dark'
colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

"use jk to exit insert mode"
inoremap jk <ESC>

"Y yanks full line"
nnoremap Y y$

"huh?
"nnoremap <leader>pw :Rg <C-R>=expand("<cwords>"<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>

"prevent arrow keys, rec'd to keep up and bc mouse wheel
map <left> <nop>
map <right> <nop>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=24

"Vimwiki no thingy
"inoremap <leader>now <CR><ESC>!!date<CR>A*<ESC>kJxA<CR><CR>
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"map <leader>ww 
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

"tab navigation
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tk :tablast<CR>
let g:ctrlp_use_caching=0

"pyhton syntax highlighing vim-polyglot"
let g:python_highlight_all=1

"airline colored tabs
let g:airline#extensions#tabline#enabled = 1
"let g:AirlineTheme='deus'

"g:applescript_config.run.output.buffer_name"
"g:applescript_config.run.output.open_command"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
"let g:instant_markdown_browser = "chrome"      " Uses surf for preview
"let g:instant_markdown_browser = "chrome --new-window"
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

