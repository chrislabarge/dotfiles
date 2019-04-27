set nocompatible " be iMproved

set rtp+=~/.vim/bundle/Vundle.vim
"call plug#begin('~/.vim/plugged')
call vundle#begin()

Plugin 'dracula/vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'luochen1990/rainbow'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-rails'
Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'Yggdroot/LeaderF'

Plugin 'dbakker/vim-projectroot'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-haml'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'

Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete-ultisnips.vim'
Plugin 'prabirshrestha/asyncomplete-buffer.vim'
Plugin 'yami-beta/asyncomplete-omni.vim'
Plugin 'wellle/tmux-complete.vim'

"Plugin 'mxw/vim-jsx'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'asux/vim-capybara'

call vundle#end()


set autoindent

set guifont=Monospace\ 12
set guioptions -=m
set guioptions -=T
set laststatus=2
set noshowmode
"
"Insert Complete height limit
set pumheight=15

let g:rainbow_active = 1

let g:lightline = {
      \	'colorscheme': 'Dracula',
      \ }

let g:limelight_conceal_ctermfg = 'gray'


syntax enable                 " Enable syntax highlighting
color dracula
"vvv Uncomment for theme colors vvvv
"set termguicolors

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
set tabstop=2

set shiftwidth=2

set softtabstop=2

set expandtab

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

function! s:goyo_enter()
  set spell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd FileType ruby compiler ruby

set shell=/bin/sh

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

"call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"    \ 'name': 'buffer',
"    \ 'whitelist': ['*'],
"    \ 'blacklist': ['go'],
"    \ 'completor': function('asyncomplete#sources#buffer#completor'),
"    \ }))

"call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"    \ 'name': 'omni',
"    \ 'whitelist': ['*'],
"    \ 'blacklist': ['c', 'cpp', 'html'],
"    \ 'completor': function('asyncomplete#sources#omni#completor')
"    \  }))
"
let g:tmuxcomplete#trigger = 'completefunc'

nmap <C-W>n :tabnew %<CR>
nmap <C-W>x :tabclose<CR>

au VimEnter * highlight Pmenu ctermbg=black guibg=black ctermfg=blue
au VimEnter * highlight PmenuSbar ctermbg=black
au VimEnter * highlight PmenuThumb ctermbg=blue

"snippets
"
function! NewIssue()

endfunction

nnoremap ,shot :-1read ~/.vim/snippets/.screenshot.rb<CR>2w
nnoremap ,here :-1read ~/.vim/snippets/.debug_puts.rb<CR>
nnoremap ,scenario :-1read ~/.vim/snippets/.scenario.rb<CR>v6j>wa
nnoremap ,issue : !gitlab issues create "" "$(cat %)"<CR>
nnoremap ,ni :new tmp/issue.md<CR>3ja
nnoremap ,ci :w \| !gitlab issues create "" "$(cat %)" && cp -f ~/.vim/snippets/.issue.md tmp/issue.md<CR>


" ----------------------------------------------------------------------------
" DiffRev
" ----------------------------------------------------------------------------
"let s:git_status_dictionary = {
"            \ "A": "Added",
"            \ "B": "Broken",
"            \ "C": "Copied",
"            \ "D": "Deleted",
"            \ "M": "Modified",
"            \ "R": "Renamed",
"            \ "T": "Changed",
"            \ "U": "Unmerged",
"            \ "X": "Unknown"
"            \ }
"function! s:get_diff_files(rev)
"  Gcd
"  exe 'nnoremap <leader>gr :Gdiff ' . a:rev . ':%<CR>'
"
"  let list = map(split(system(
"              \ 'git diff --name-status '.a:rev), '\n'),
"              \ '{"filename": matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
"              \ )
"  call setqflist(list)
"  copen
"
"endfunction

"command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)

" ----------------------------------------------------------------------------
" Cursor Change on Insert
" ----------------------------------------------------------------------------
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
