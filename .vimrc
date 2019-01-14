set nocompatible " be iMproved

set rtp+=~/.vim/bundle/Vundle.vim
"call plug#begin('~/.vim/plugged')
call vundle#begin()
Plugin 'dracula/vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'dhruvasagar/vim-zoom'

"tmux
Plugin 'christoomey/vim-tmux-navigator'

"snippet stuff
"Plugin 'garbas/vim-snipmate'

"rails
Plugin 'tpope/vim-rails.git'

"Plugin 'asux/vim-capybara'

Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'ervandew/supertab'
"
Plugin 'Yggdroot/LeaderF'

Plugin 'scrooloose/nerdtree'
Plugin 'dbakker/vim-projectroot'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-haml'
"Plugin 'mattn/emmet-vim'

"Plugin 'skywind3000/asyncrun.vim'
"Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'prabirshrestha/asyncomplete-ultisnips.vim'
Plugin 'prabirshrestha/asyncomplete-buffer.vim'
Plugin 'yami-beta/asyncomplete-omni.vim'
Plugin 'wellle/tmux-complete.vim'

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

"let g:ale_fixers = {
"      \	'ruby': ['rubocop'],
"      \ 'javascript': ['eslint'],
"      \ 'jsx': ['eslint'],
"      \ }
"let g:ale_linter_aliases = {'jsx': 'css'}
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '·'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"let g:ale_set_highlights = 0


let g:limelight_conceal_ctermfg = 'gray'


syntax on                 " Enable syntax highlighting
colo dracula
filetype plugin indent on " Enable filetype-specific indenting and plugins
"set list listchars=tab:\ \ ,trail:·

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
autocmd FileType ruby,eruby,:yaml,markdown,haml set ai sw=2 sts=2 et
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
"
function! s:goyo_enter()
  set spell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

"resizing
" ===== Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing -v
" 3.0.0.beta.6`
" ...yeah, current release is a beta, which won't auto-install

" Annotate every line

nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;

" Annotate marked lines

nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;

" Remove annotations

nmap <leader>c :%.!seeing_is_believing --clean<CR>;

" Mark the current line for annotation

nnoremap <leader>m A # => <Esc>

" Mark the highlighted lines for annotation

vnoremap <leader>m :norm A # => <Esc>


autocmd FileType ruby compiler ruby

set shell=/bin/sh

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "<C-X>"
"let g:SuperTabDefaultCompletionType = "context"

let g:lsp_auto_enable = 1
let g:lsp_signs_enabled = 1         " enable diagnostic signs / we use ALE for now
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '●'}
let g:lsp_signs_warning = {'text': '!'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_signs_information = {'text': '·'}
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.config/vim-lsp.log')

if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif


inoremap <expr> <TAB> (pumvisible() ? "\<C-n>" : "\<TAB>")
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <C-j> (pumvisible() ? "\<C-n>" : "\<C-j>")
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"

let g:asyncomplete_remove_duplicates = 1

"this is for removing the status on completion on the bottom
"set shortmess+=c

"let g:asyncomplete_smart_completion = 1
set completeopt-=preview
"autocmd FileType ruby setlocal omnifunc=lsp#complete
set signcolumn=yes
au VimEnter * highlight clear SignColumn

"Fuzzy file finder
let g:Lf_ShortcutF = '<C-P>'

let g:UltiSnipsExpandTrigger="<c-e>"

nnoremap gd :LspDefinition<CR>

call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

"call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"    \ 'name': 'omni',
"    \ 'whitelist': ['*'],
"    \ 'blacklist': ['c', 'cpp', 'html'],
"    \ 'completor': function('asyncomplete#sources#omni#completor')
"    \  }))
"
"let g:tmuxcomplete#trigger = 'completefunc'

nmap <C-f> :tabnew %<CR>
nmap <C-m> :tabclose<CR>

au VimEnter * highlight Pmenu ctermbg=black guibg=black
