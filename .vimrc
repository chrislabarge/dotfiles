set nocompatible " be iMproved
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"set runtimepath+=~/.vim-plugins/LanguageClient-neovim
runtime macros/matchit.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'name': 'dracula'  }
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tlib_vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'luochen1990/rainbow'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rails'
"Plug 'gmarik/vundle'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/LeaderF'
Plug 'dbakker/vim-projectroot'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'

"Plugin 'Shougo/neoinclude.vim'
"
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/async.vim'
"
"Plugin 'kyouryuukunn/asyncomplete-neoinclude.vim'
"Plugin 'prabirshrestha/asyncomplete-necovim.vim'
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'prabirshrestha/asyncomplete-lsp.vim'
"Plugin 'ryanolsonx/vim-lsp-javascript'
"
"Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
"Plug 'prabirshrestha/asyncomplete-buffer.vim'
"Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'wellle/tmux-complete.vim'
"
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-git'
Plug 'idanarye/vim-merginal'
Plug 'flazz/vim-colorschemes'
Plug 'posva/vim-vue'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-bundler'
Plug 'dense-analysis/ale'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-rvm'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plugin 'mxw/vim-jsx'
"Plugin 'asux/vim-capybara'

call plug#end()

filetype plugin indent on " Enable filetype-specific indenting and plugins
set autoindent

set guifont=Monospace\ 12
set suffixesadd+=.rb
set guioptions -=m
set guioptions -=T
set laststatus=2
set noshowmode
"
"Insert Complete height limit
set pumheight=15

let g:rainbow_active = 1

let g:lightline = {
      \	'colorscheme': 'dracula',
      \ }

let g:limelight_conceal_ctermfg = 'gray'


syntax enable                 " Enable syntax highlighting
"colorscheme dracula
"vvv Uncomment for theme colors vvvv
"set termguicolors
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

"let g:lsp_auto_enable = 1
"let g:lsp_signs_enabled = 1         " enable diagnostic signs / we use ALE for now
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"let g:lsp_signs_error = {'text': '●'}
"let g:lsp_signs_warning = {'text': '!'}
"let g:lsp_signs_hint = {'text': '?'}
"let g:lsp_signs_information = {'text': '·'}
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/.config/vim-lsp.log')

"if executable('solargraph')
"    " gem install solargraph
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'solargraph',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"        \ 'initialization_options': {"diagnostics": "true"},
"        \ 'whitelist': ['ruby'],
"        \ })
"endif
"
set hidden

"Language Server
"let g:LanguageClient_serverCommands = {
"    \ 'ruby': ['solargraph', 'stdio'],
"    \}
"
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"nnoremap gd :LspDefinition<CR>

inoremap <expr> <TAB> (pumvisible() ? "\<C-n>" : "\<TAB>")
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <C-j> (pumvisible() ? "\<C-n>" : "\<C-j>")
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"let g:asyncomplete_remove_duplicates = 1

"this is for removing the status on completion on the bottom
"set shortmess+=c

"let g:asyncomplete_smart_completion = 1
set completeopt-=preview
"autocmd FileType ruby setlocal omnifunc=lsp#complete
set signcolumn=yes
au VimEnter * highlight clear SignColumn

"Fuzzy file finder
let g:Lf_ShortcutF = '<Space>f'

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:tmuxcomplete#trigger = ''

"call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"    \ 'name': 'buffer',
"    \ 'whitelist': ['*'],
"    \ 'completor': function('asyncomplete#sources#buffer#completor'),
"    \ 'config': {
"    \    'max_buffer_size': 1000000,
"    \  },
"    \ }))
"
"call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"    \ 'name': 'ultisnips',
"    \ 'whitelist': ['*'],
"    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"    \ }))
"
"let g:tmuxcomplete#asyncomplete_source_options = {
"            \ 'name':      'tmuxcomplete',
"            \ 'whitelist': ['*'],
"            \ 'config': {
"            \     'splitmode':      'words',
"            \     'filter_prefix':   1,
"            \     'show_incomplete': 1,
"            \     'sort_candidates': 0,
"            \     'scrollback':      0,
"            \     'truncate':        0
"            \ }
"            \ }

"call asyncomplete#register_source(asyncomplete#sources#neoinclude#get_source_options({
"    \ 'name': 'neoinclude',
"    \ 'whitelist': ['*'],
"    \ 'refresh_pattern': '\(<\|"\|/\)$',
"    \ 'completor': function('asyncomplete#sources#neoinclude#completor'),
"    \ }))"'

"call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"    \ 'name': 'omni',
"    \ 'whitelist': ['*'],
"    \ 'blacklist': ['c', 'cpp', 'html'],
"    \ 'completor': function('asyncomplete#sources#omni#completor')
"    \  }))
"

nmap <C-W>n :tabnew %<CR>
nmap <C-W>x :tabclose<CR>

au VimEnter * highlight Pmenu ctermbg=black guibg=black ctermfg=blue
au VimEnter * highlight PmenuSbar ctermbg=black
au VimEnter * highlight PmenuThumb ctermbg=blue

"snippets
"
nnoremap <Space>shot :-1read ~/.vim/snippets/.screenshot.rb<CR>>>.
nnoremap <Space>here :-1read ~/.vim/snippets/.debug_puts.rb<CR>
nnoremap <Space>html :-1read ~/.vim/snippets/.write_feature_html.rb<CR>v2j>.
nnoremap <Space>scenario :-1read ~/.vim/snippets/.scenario.rb<CR>v6j>wa
nnoremap <Space>issue : !gitlab issues create "" "$(cat %)"<CR>
nnoremap <Space>ni :new tmp/issue.md<CR>3ja
nnoremap <Space>ci :w \| !gitlab issues create "" "$(cat %)" && cp -f ~/.vim/snippets/.issue.md tmp/issue.md<CR>


nnoremap <Space>mc : !gitlab comments create 'new-branch' "$(echo @%)"  "$(echo line('.'))" "$(cat %)"


function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    Copen

    call feedkeys("10")
    call feedkeys("\<C-W>")
    call feedkeys("+")
endfunction

nnoremap <C-W>q :Copen<CR>
nnoremap <Space>o :call QuickFix_toggle()<CR>
"Clean quickfix window
nmap <Space>qc :cexpr []<CR>
nnoremap <Space>l :call RunLastSpec()<CR>
nnoremap <Space>s :call RunNearestSpec()<CR>
nnoremap <Space>a :call RunCurrentSpecFile()<CR>
nnoremap <Space>af :Dispatch! rspec --only-failures<CR>

function! GoToDefinition()
  Ggrep 'def \<<cword>\>' **
endfunction

function! GoToSearch()
  Ggrep '\<<cword>\>' **
endfunction

nnoremap <Space>gd :call GoToDefinition()<CR><CR>zz
nnoremap <Space>gs :call GoToSearch()<CR>

let g:rspec_command = "Dispatch! rspec --color {spec}"

set background=dark

set term=screen-256color

" ----------------------------------------------------------------------------
" Cursor Change on Insert
" ----------------------------------------------------------------------------
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

au FileType gitcommit setlocal tw=72

set diffopt+=vertical

set complete-=i

let prettier=$PRETTIER

if prettier == 'true'
  :autocmd BufWritePost * Dispatch! yarn prettier --write <afile>
endif

augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.js.haml   set syntax=javascript
augroup END

let g:dracula_italic = 0
let g:dracula_colorterm = 0

let g:ale_sign_error = '●'
let g:ale_sign_warning = '!'

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \}

let g:ale_fix_on_save = 1
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
