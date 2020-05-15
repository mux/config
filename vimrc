set nocompatible
set modeline
set hlsearch
set encoding=UTF-8
filetype indent plugin on
syntax on

if !has('gui_running')
  set t_Co=256
endif

if has('termguicolors')
  set termguicolors
endif

set background=dark

" Persistent undos
try
  set undodir=~/.vim/undos
  set undofile
catch
endtry

" Better auto-completions for commands
set wildmenu
set wildmode=longest:full,full

" Bug work-around
autocmd BufNewFile,BufRead *.md set filetype=markdown

let mapleader = ','

" Convenient shortcuts for tabs
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <silent> <Leader>0 :tablast<CR>

" Try to install vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim'	" Colorscheme
Plug 'tpope/vim-fugitive'	" Git extensions
"Plug 'thaerkh/vim-workspace'	" Workspaces
Plug 'preservim/nerdtree'	" File explorer
Plug 'ctrlpvim/ctrlp.vim'	" File finder
Plug 'mhinz/vim-startify'	" Start screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" This one has to be the last one
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme jellybeans

set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
" Somehow those VCS checks break the statusline
let g:airline#extensions#branch#vcs_checks = [] " ['untracked', 'dirty']

" Make CtrlP open in a new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<C-t>'],
    \ 'AcceptSelection("t")': ['<CR>', '<2-LeftMouse>'],
    \ }

nnoremap <Leader>f :NERDTreeToggle<Enter>
