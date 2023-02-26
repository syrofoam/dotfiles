set termguicolors        " enable 24-bit RGB colors
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set undofile                " enable undo file
set undoreload=10000        " set the number of lines to remember for undo
set undodir=~/.cache/nvim    " Directory to store undo files.
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
map <F1> :set number!<CR> :set relativenumber!<CR>
map <F2> :set cursorline!<CR>
map <F3> :set list!<CR>
map <F4> :colorscheme<Space>
noremap <silent> <F5> :NERDTreeToggle<CR>
map <F7> :set spelllang=en_US<CR>
map <F8> :set nospell<CR>
call plug#begin('~/.local/share/nvim/site/loaded/plug.vim')
call plug#end()
call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
colorscheme catppuccin
