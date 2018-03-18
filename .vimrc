set nocompatible " be iMproved

set rtp+=~/.vim/bundle/Vundle.vim
"call plug#begin('~/.vim/plugged')
call vundle#begin()
Plugin 'dracula/vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
"snippet stuff
Plugin 'garbas/vim-snipmate'

"Plugin 'tpope/vim-fugitive'

"rails
Plugin 'tpope/vim-rails.git'

Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dbakker/vim-projectroot'

call vundle#end()

"call plug#end()

set autoindent 

set guifont=Droid\ Sans\ Mono\ 12
set guioptions -=m
set guioptions -=T
set laststatus=2
set noshowmode

let g:lightline = {
      \	'colorscheme': 'Dracula',
      \ }

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

syntax enable

" Tab completion
" set wildmode=list:longest,list:full
" set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif


map <C-n> :NERDTreeToggle<CR>

set clipboard=unnamed
set nu
