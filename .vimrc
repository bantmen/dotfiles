syntax enable

"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized

packadd! dracula
colorscheme dracula

" Press Space to turn off highlighting and clear any message already displayed.
:noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set mouse=a
set ruler
set wildmenu
set shortmess-=S " TODO: Why is this broken?

" Python
" breakpoint
map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc> 
" terminal commands
command Py vertical botright term ipython3
command Py2 vertical botright term ipython2
"TODO
"autocmd FileType python map <buffer> <S-e> :w<CR>:!/usr/bin/env python %<CR>
" vim-slime
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1
"map <Enter> <C-n> <C-n>
"nmap <f5> :w<cr>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
nmap <f5> :w<cr>:SlimeSend0 "time python3 " . expand('%') . "\n"<CR>
nmap <f6> :w<cr>:SlimeSend0 "python3 -i " . expand('%') . "\n"<CR>
nmap <f7> :w<cr>:SlimeSend0 "python3 -m cProfile  " . expand('%') . "\n"<CR>
nmap <f8> :w<cr>:SlimeSend0 "time python2 " . expand('%') . "\n"<CR>

command Term vertical botright term
" Add the current file path to copy buffer.
command Fn :let @+ = expand("%")
command Src :source ~/.vimrc
" Used to change the working directory for a new tab. This way, FZF search is
" done in the correct place.
command Cwd :lcd %:p:h

set rtp+=/usr/local/opt/fzf

" fzf
nmap ; :FZF<CR>
nmap , :Buffers<CR>
nnoremap <Leader>rg :Rg<Space>
"nnoremap <Leader>rgs :Rg . "expand('<cword>')"
nnoremap <Leader>rgs exe(:Rg expand('<cword>') *)
" Don't surface .gitignore files
let $FZF_DEFAULT_COMMAND = 'rg -S --files --hidden'

nnoremap <leader>bb :Rg expand('<cword>')
nnoremap <leader>bc :Rg annotation<CR>


" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$']

" vim-workspace
let g:workspace_autocreate =1

au BufNewFile,BufRead *.mm set filetype=objcpp

nnoremap gb :ls<CR>:buffer<Space>

" Hide swp files in Explore
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'

" vim-plug
" TODO: Add dracula here
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'jupyter-vim/jupyter-vim'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'thaerkh/vim-workspace'
call plug#end()

"
" A (not so) minimal vimrc.
" https://github.com/mhinz/vim-galore/blob/master/static/minimal-vimrc.vim
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files

function! Mkdir(path)
    if !isdirectory(a:path)
        call mkdir(a:path, "p")
    endif
endfunction

call Mkdir($HOME."/.vim/files")
call Mkdir($HOME."/.vim/files/backup")
call Mkdir($HOME."/.vim/files/swap")
call Mkdir($HOME."/.vim/files/undo")
call Mkdir($HOME."/.vim/files/info")

set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo
set belloff=all " no error bell
