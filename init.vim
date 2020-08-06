"WIP, don't judge

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim native settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin on

"Display all matching files when we tab complete
set wildmenu "Display all matching files when we tab complete

set noerrorbells
set tabstop=4 softtabstop=4
set expandtab "convert tab to space?
set smartindent
set undodir=~/.vim/undodir "must add undodir
set undofile
set shiftwidth=4
set rnu " shows active line number amid relative numbers
set number relativenumber
set nowrap
set smartcase "affects searching
set noswapfile
set incsearch  "displays search results dynamically while typed"
set nohlsearch "add no highlight to search

"add fuzzy search :find *
set path+=**

"give more space for displaying messages 
set cmdheight=2

"shorten update time to avoid errors/improve experience
set updatetime=50

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}  "COC completion
Plug 'jremmen/vim-ripgrep'                       "adds rg, turn off roor thing for ** :find?
Plug 'vim-utils/vim-man'                         "vim man pages
Plug 'tpope/vim-fugitive'                        "git support
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', {'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'                       "necessary with built ins?
Plug 'vim-python/python-syntax'                   "necessary with built ins?
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'tpope/vim-commentary'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'puremourning/vimspector'
"Plug 'lyuts/vim-rtags'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorschemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"general colors, font, background
colorscheme gruvbox
set background=dark
"strip and tab colors
let g:airline_solarized_bg='dark'
let g:airline_theme='dark'
"airline colored tabs
let g:airline#extensions#tabline#enabled = 1
"vim built in width designator
set colorcolumn=75
highlight ColorColumn ctermbg=3 guibg=orange

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => RG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"doesthis mess up built in fuzzy find?
if executable('rg')
    let g:rg_derive_root='true'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

"use jk to exit insert mode"
inoremap jk <ESC>
"nnoremap sop :source %<CR>

"Y yanks full line"
nnoremap Y y$

"huh?
"nnoremap <leader>pw :Rg <C-R>=expand("<cwords>"<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>

"prevent arrow keys, rec'd to keep up and bc mouse wheel
map <left> <nop>
map <right> <nop>

"tab navigation some broken?
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

set pyxversion=3 "sets pythonv version?
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc keybinds found in coc config
source $HOME/.config/nvim/plug-config/coc.vim
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
let g:python_host_provider = '/usr/local/lib/python3.8'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeWinSize=24

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vimwiki now thingy
"inoremap <leader>now <CR><ESC>!!date<CR>A*<ESC>kJxA<CR><CR>
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NetRW Window scaling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pyhton syntax highlighing vim-polyglot"
let g:python_highlight_all=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Applescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"g:applescript_config.run.output.buffer_name"
"g:applescript_config.run.output.open_command"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
"let g:instant_markdown_browser = "chrome"      " Uses surf for preview
"let g:instant_markdown_browser = "chrome --new-window"
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"python shortcuts until I learn how to do it with built in?
"python shortcuts
inoremap <C-_> if __name__ == '__main__':<CR>main()<CR><ESC>
inoremap j;j #!/usr/bin/python3<CR>
inoremap <C-a> #@TODO:<SPACE>
nnoremap <LEADER>d 0O'''<CR>DOCSTRING:<CR><BACKSPACE>Input:<CR><BACKSPaCE>Output:<CR><BACKSPACE>'''<ESC>kkkA<SPACE>

nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <C-n> :Ex<CR>

"toggle relative numbers with leader + #
nnoremap <silent><expr> <leader>#
      \ ":set "
      \ .(&relativenumber ? "norelativenumber number" : "relativenumber number")
      \ ."<CR>"

" make alt b and alt n shuffle buffers?


" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3   

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
" highlight! link NERDTreeFlags NERDTreeDir

