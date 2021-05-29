scriptencoding utf-8
set encoding=utf-8
set ttyfast "I have gpu accel term
" Usfull tips::::::::::::::::::::::::::::::::::::::::::::::::::::::
" "UNHOLY VISUAL MODE" is "CTRL-V"
" ":sort" mnrmnaughmnrmnaughmnrmnaughmnrmnaughmnrmnaughmnrmnaughysFire� >yo dawg iysFire� >yo dawg iysFire� >yo dawg iu / TO remove duplicates
" ":,$s/^/#" To comment every "SEARCH REPLACE" line with #
" "!!" to start "bash command". ".!cal"
" ":undolist" for list of changes to "undo"
" "gg" to "start" or "G" to "go to end" or "%"
" "$" end of line.
" "w" to "JUMP" words forward.
" "e" move forwar "JUMP Faster"
" "b" jump words "BACKWARDS".
" search and remove "s/input//g".


" use "x" to delete in command mode.
" "A" will "APPEND"to end of line.
" "dw" delete word. "d2w" delete two.
" "D" delete "rest of line".
" "$" to "jump to start of line"
" "daw" to "delete a word"
" "dap" to "delete around paragraph"
" Back to configure::::::::::::::::::::::::::::::::::::::::::::::::
"set autoindent "if need auto tab"not needed exept for C#
set nocompatible
filetype plugin on
set wildmenu "Sweet tab menu
nnoremap ,vims :-1read $HOME/.vimrc<CR>
" Browsing files "F8" to start.
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"browsing :edit filename. <CR>/v/t h-split/vsplit/tab
set laststatus=2
set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2
endif
    
syntax on
"lets make "function keys", "turn off and on" (1-4).
map <F1> :set number!<CR> :set relativenumber!<CR>
map <F2> :set cursorline!<CR>
map <F3> :set list!<CR>
map <F4> :colorscheme<Space>
map <F5> :set hlsearch<CR>
map <F6> :hi Normal guibg=NONE ctermbg=NONE<CR>
map <F7> :set spelllang=en_US<CR>
map <F8> :set nospell<CR>
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
"set listchars=eol:´,tab:>·,trail:~,extends:>,precedes:<,space:·

set mouse=r
"Search settings
set incsearch
set linebreak
nnoremap <c-f> :nohlsearch<CR>

filetype indent on
set history=1000
" Undo med u redo med ctrl+r
set undofile
set undoreload=2500

au FocusLost * :wa
"resize snadder
au VimResized * exe "normal! \<c-w="
"When opening edited files "goto" same line number
augroup line_return

    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif

augroup END
" Backups make backup so you can "undo" changes from backups.
set backup                        " enable backups
set noswapfile                    " it's 2019, Vim.




" "Di()" to "Delete" inside "quotes"
" "dd+p" is "Delete and paste"
" "d:500" delete from current pos to line 500.
" "cc" remove and change current line jumps into insert mode.
" ".." repeat last "command" again.
" "U" undo "all-combined" changes to a current line.
" "ctrl+r" to "redo"
" "ZZ" to "save and exit" or "QZ" to "not save"
" "{ & }" to "move up and down"
" "A" to "insert mode at EOL" or "a" 
" "I" to insert "BOL"
" "NN" to "sarch previous word"
" "OO" to "insert line start typing"
" "0" beginning of line "$" to end of line

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
"Moive inside "buffers" switch with "ctrl hjkl"
map <C-O> :Sexplore<CR>
nmap <C-N> :sp<esc> 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 
"let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"	  autocmd!
"	    autocmd VimEnter * :Vexplore
"    augroup END
set backspace=indent,eol,start
"colorscheme default
colorscheme darkblue
"prevents truncuated yanks deletes, etc.
set viminfo='20,<1000,s1000
set number 
set noshowmode
"call plug#begin()
"Plug 'ap/vim-css-color'
"Plug 'dracula/vim', { 'as': 'dracula' }
"call plug#end()
"let g:lightline = {
"	\ 'colorscheme': 'wombat',
"	\ }
"fix "visual" when transparent term. Visual dont exist vim/ex from "1970"
highlight clear CursorLine to clear the current cusorline hl
highlight CursorLine gui=underline cterm=underline 
highlight Visual cterm=bold,underline ctermbg=Black ctermfg=NONE
"To center editor dot "mouse" in some "term"
set scrolloff=999
"REPLACE & SEARCH "Insert replace text AND /"
nnoremap <C-g> :%s//g<left><left>
