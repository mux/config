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

" Try to install vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
"Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:seoul256_background = 235
colorscheme seoul256
set laststatus=2
set noshowmode

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
"let g:lightline = {
"	\ 'colorscheme': 'wombat',
"	\ 'active': {
"	\   'left': [ [ 'mode', 'paste' ],
"	\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"	\ },
"	\ 'component': {
"	\   'lineinfo': ' %3l:%-2v',
"	\ },
"	\ 'component_function': {
"	\   'fugitive': 'LightlineFugitive',
"	\   'readonly': 'LightlineReadonly',
"	\   'filename': 'LightlineFilename'
"	\ },
"	\ 'separator': { 'left': '', 'right': '' },
"	\ 'subseparator': { 'left': '', 'right': '' }
"	\ }
"function! LightlineReadonly()
"	return &readonly ? '' : ''
"endfunction
"function! LightlineFugitive()
"	if exists('*FugitiveHead')
"		let branch = FugitiveHead()
"		return branch !=# '' ? 'ᚠ '.branch : ''
"	endif
"	return ''
"endfunction
"function! LightlineFilename()
"  return expand('%F')
"endfunction
 
nnoremap <Leader>f :NERDTreeToggle<Enter>
" Windows cannot render the arrow glyphs somehow
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
