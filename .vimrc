set nocompatible " be iMproved

set rtp+=~/.vim/bundle/Vundle.vim
"call plug#begin('~/.vim/plugged')
call vundle#begin()
Plugin 'dracula/vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'w0rp/ale'

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
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mxw/vim-jsx'
"Plugin 'mattn/emmet-vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()

"call plug#end()

set autoindent

set guifont=Monospace\ 12
set guioptions -=m
set guioptions -=T
set laststatus=2
set noshowmode

let g:lightline = {
      \	'colorscheme': 'Dracula',
      \ }

let g:ale_fixers = {
      \	'ruby': ['rubocop'],
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ }
"let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_set_highlights = 0


syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,:yaml,markdown set ai sw=2 sts=2 et
augroup END

syntax enable
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

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

inoremap jj <ESC>
inoremap jk <ESC>

map <C-n> :NERDTreeToggle<CR>

"window splits
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set clipboard=unnamed
set nu
"gets rid of whitespace
autocmd BufWritePre * :%s/\s\+$//e
"sets the jsx filetype for each file

"augroup FiletypeGroup
"    autocmd!
"    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
"augroup END

"This is for formatting the js files on save.
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
"xnoremap p pgvy
