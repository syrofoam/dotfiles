" kurs {{{ CTRL + N for autocomplete husk
set nocompatible
filetype plugin on
set path+=**
set wildmenu
" kurs end
nnoremap ,vims :-1read $HOME/.vimrc<CR>
" Browsing files
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"browsing :edit filename. <CR>/v/t h-split/vsplit/tab
set laststatus=2
set statusline=%f
set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
syntax on
set list
set listchars=tab:>-
set mouse=a
colorscheme torte
set incsearch
set hlsearch
filetype indent on
"noremap keybindings
nnoremap <c-f> :nohlsearch<CR>
set encoding=utf-8
set history=1000
" Undo med u redo med ctrl+r
set undofile
set undoreload=2500
au FocusLost * :wa
"resize snadder
au VimResized * exe "normal! \<c-w="
"Reise tilbake til samme linjer ette lukk
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2019, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
"Calculator Kalyle+CTRL-B
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
nmap <C-Tab> :tabnext<CR>
"map <F8> :NERDTreeToggle<CR>
":undolist ! Sjekke undos
set backspace=indent,eol,start
colorscheme peachpuff
"prevents truncuated yanks deletes, etc.
set viminfo='20,<1000,s1000
set number 
"set relativenumber
set noshowmode
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
call plug#end()
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
"test other highlight color
highlight clear CursorLine to clear the current cusorline hl
highlight CursorLine gui=underline cterm=underline 
highlight Visual cterm=bold ctermbg=Green ctermfg=NONE
