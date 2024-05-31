call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'jdhao/better-escape.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yazeed1s/minimal.nvim'
Plug 'mechatroner/rainbow_csv'
call plug#end()

" Quick settings
command! Config edit ~/.config/nvim/init.vim

" Quick :Explore
nnoremap E :Explore<CR>

" No generating of backup files
set nobackup
set nowritebackup
set noswapfile

" Wrap cursor to prev/next line
set whichwrap+=>,l
set whichwrap+=<,h
set whichwrap+=[,]

" Automatically read on change
set autoread

" No noise
set visualbell

" Enable mouse
set mouse=a

" Line numbers
set ruler
set relativenumber
set nu rnu
set cursorline
set cursorlineopt=number

" Netrw stuff
let g:netrw_liststyle=3

" Theme
try
    colorscheme minimal
    highlight Todo guibg=#E85A84 guifg=#4D5264
    highlight NetrwDir guifg=#94DD8E
catch /^Vim\%((\a\+)\)\=:E185/ " Theme not found
    highlight CursorLine term=none cterm=none
    highlight LineNr ctermfg=grey
    highlight CursorLineNr cterm=bold guifg=Yellow ctermfg=11
endtry

" Indent using spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Not wrap lines
set nowrap

" Semicolon
nnoremap ; A;<ESC>

" Allow cgn for word under cursor
nnoremap <silent> c<Tab> :let @/=expand('<cword>')<cr>cgn

" Fix tmux messing with theme
if &term =~ '256color'
    set t_ut=
endif

" Coc stuff
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <C-Space> coc#pum#visible() ? coc#pum#stop() : coc#refresh()
let g:coc_global_extensions = ['coc-clangd', 'coc-rust-analyzer']

" Rainbow CSV stuff
let g:disable_rainbow_hover = 1
