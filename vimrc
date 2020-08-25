set encoding=UTF-8
set modeline
set hlsearch

if !has('gui_running')
  set t_Co=256
endif

if has('termguicolors')
  set termguicolors
endif

" Persistent undos
set undodir=~/.vim/undos
set undofile

" Better auto-completions for commands
set wildmode=longest:full,full

" Bug work-around
autocmd BufNewFile,BufRead *.md set filetype=markdown

let mapleader = ','

" Convenient shortcuts for buffers & tabs
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <silent>   <TAB>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <S-TAB>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
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
let g:startify_session_persistence = 1
colorscheme jellybeans

set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
" The following checks break rendering for me
let g:airline#extensions#branch#vcs_checks = [] " ['untracked', 'dirty']

nnoremap <silent> <Leader>f :NERDTreeToggle<Enter>
