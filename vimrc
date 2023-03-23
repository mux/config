set nocompatible
set encoding=utf-8
set modeline
set hlsearch
set autoread

" Persistent undos
set undodir=~/.vim/undos
set undofile

" Better auto-completions for commands
set wildmode=longest:full,full

" Good defaults for working with the mouse
set mouse=a
set ttymouse=sgr
" Some customizations for :term
set termwinsize=10x0
set splitbelow
augroup termIgnore
  autocmd!
  autocmd TerminalOpen * set nobuflisted
augroup END

" Automatically jump back to the last position in a file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

let mapleader = ','

" Convenient shortcuts for buffers & tabs
set hidden
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <silent>   <TAB>  :bnext<CR>
nnoremap <silent> <S-TAB>  :bprevious<CR>
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
Plug 'nanotech/jellybeans.vim'		" Colorscheme
Plug 'tpope/vim-sensible'		" Good default settings
Plug 'tpope/vim-repeat'			" Better .
Plug 'tpope/vim-commentary'		" Comment with gc
Plug 'tpope/vim-fugitive'		" Git extensions
Plug 'tpope/vim-unimpaired'		" Useful commands
Plug 'tpope/vim-surround'		" Quoting etc
Plug 'preservim/nerdtree'		" File explorer
Plug 'ctrlpvim/ctrlp.vim'		" File finder
Plug 'mhinz/vim-startify'		" Start screen
Plug 'vim-airline/vim-airline'		" Cute statusline
Plug 'vim-airline/vim-airline-themes'	" Themes for statusline
Plug 'bfrg/vim-cpp-modern'		" Modern C/C++ syntax highlighting

" This plugin has to be the last one
Plug 'ryanoasis/vim-devicons'		" Cute icons
call plug#end()

" List bookmarks and sessions first
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_session_sort = 1

let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2
" I find that the 'untracked' and 'dirty' checks look weird stuck to the
" branch name without spacing, and they don't show immediately but only after
" you move in the file or use a command, which feels buggy.
let g:airline#extensions#branch#vcs_checks = []

" Always follow symlinks
let g:ctrlp_follow_symlinks = 2

nnoremap <silent> <Leader>f :NERDTreeToggle<Enter>

set noshowmode
set laststatus=2

colorscheme jellybeans

" Works around an obscure vim terminal handling bug that results
" in a strange ^[[?12;4$y escape sequence being printed.
set t_RV=
