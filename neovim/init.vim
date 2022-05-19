"set exrc
set nocompatible " be iMproved
filetype off
runtime macros/matchit.vim
"
" Disable files that already have synatx highlighting plugins
let g:polyglot_disabled = ['ruby', 'haml', 'markdown']

let mapleader = " " " map leader to Space

call plug#begin('~/.vim/plugged')

"Utilities
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'kamykn/spelunker.vim'
Plug 'rhysd/devdocs.vim'
Plug 'machakann/vim-swap'

"Root-Scope Tool
Plug 'dbakker/vim-projectroot'

"Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Status Line
Plug 'itchyny/lightline.vim'

"Linter
"Plug 'dense-analysis/ale'
"
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
Plug 'OmniSharp/omnisharp-vim'
"
"Git Tools
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal' " Requires fugitive

"Color Themes
Plug 'dracula/vim', { 'name': 'dracula'  }
Plug 'altercation/vim-colors-solarized'
"Plug 'flazz/vim-colorschemes'

" Distraction Free Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"thought-bot plug-ins
Plug 'christoomey/vim-tmux-navigator'
Plug 'thoughtbot/vim-rspec'

"Language plug-ins
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'

"Tim Pope Plug-ins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-repeat'

"Split/Join Args and Lists
Plug 'AndrewRadev/splitjoin.vim'

"Calendar
"Plug 'itchyny/calendar.vim'

"syntax highlighting
Plug 'sheerun/vim-polyglot'

"Plug 'frazrepo/vim-rainbow'
Plug 'luochen1990/rainbow'

Plug 'jpalardy/vim-slime'

call plug#end()

" Shell executable
set shell=/bin/zsh

let g:slime_target = "neovim"

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'fzf'
" When using `gf` to navigate files
set suffixesadd+=.rb,.js,.md
" smart case-insensitive searches - Coupled together
" Using smartcase (requires ignorecase)
set ignorecase
set smartcase

" TODO: Does this do anything?
augroup myfiletypes
" Clear old autocmds in group
autocmd!
" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,:yaml,markdown set ai sw=2 sts=2 et
augroup END

" TODO: Does this overwrite the one above?
autocmd FileType ruby compiler ruby

" Have js.haml files use JS syntax
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.js.haml   set syntax=javascript
augroup END


" To allow for hml + GO syntax in HUGO files
augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END

" Enable filetype-specific indenting and plug-ins
filetype plugin indent on
set autoindent

" Yank/Copy Setting
set clipboard=unnamed

"Show Line Number
set nu

"Tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Status Line Options
" Always show the status line
set laststatus=2
set noshowmode

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

let g:limelight_conceal_ctermfg = 'gray'

autocmd VimEnter * call SetupLightlineColors()

" Allow for custom background
let g:dracula_colorterm = 0

syntax enable

colorscheme dracula
set background=dark

"colorscheme solarized
"set background=light
"syntax enable

"Autocomplete window colors
au VimEnter * highlight Pmenu ctermbg=black guibg=black ctermfg=blue
au VimEnter * highlight PmenuSbar ctermbg=black
au VimEnter * highlight PmenuThumb ctermbg=blue

let g:rainbow_active = 1
"""""""""""""""""""""""""""""""""""""""""
"" Rainbow plugin
"""""""""""""""""""""""""""""""""""""""""
"let g:rainbow_guifgs = ['LightBlue1', 'SeaGreen2', 'LightCyan1', 'HotPink']
"let g:rainbow_ctermfgs = ['cyan', 'orange', 'yellow', 'red', 'magenta']


""""""""""""""""""""""""""""""""""""""""
" Custom Highlights
""""""""""""""""""""""""""""""""""""""""
" Don't mark URL-like things as spelling errors
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
" Change the color of the spell check
highlight SpellBad ctermbg=NONE ctermfg=Red
" Highlight and make Status keywords bold
sy match doneStatus "\v<DONE>"
highlight doneStatus cterm=bold ctermbg=NONE ctermfg=LightGreen
sy match todoStatus "\v<TODO>"
highlight todoStatus cterm=bold ctermbg=NONE ctermfg=red
sy match testStatus "\v<TEST>"
highlight testStatus cterm=bold ctermbg=NONE ctermfg=cyan
sy match doingStatus "\v<DOING>"
highlight doingStatus cterm=bold ctermbg=NONE ctermfg=yellow
sy match blockedStatus "\v<BLOCKED>"
highlight blockedStatus cterm=bold ctermbg=NONE ctermfg=magenta

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

""""""""""""""""""""""""""""""""""""""""
" Save your swp files to a less annoying place than the current directory.
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/swap') == 0
:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif

set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" store state of previous session
set viminfo+=n~/.vim/viminfo

" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo ( :help undo-persistence )
if exists("+undofile")
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" ----------------------------------------------------------------------------
" Cursor Change on Insert
" ----------------------------------------------------------------------------
if &term =~ "screen."
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"
else
    let &t_ti.="\<Esc>[1 q"
    let &t_SI.="\<Esc>[5 q"
    let &t_EI.="\<Esc>[1 q"
    let &t_te.="\<Esc>[0 q"
endif

"Window Split Navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
"window splits
set splitbelow
set splitright

"Enlarge Current Window by opening in a new tab
nmap <C-W>n :tabnew %<CR>
"
" TODO: Is this redundant?
"gets rid of whitespace
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""
"Plugin Settings
"""""""""""""""""""""""""""""""""""""
" Use background dispatch process to run specs
let g:rspec_command = "Dispatch! rspec --color {spec}"

" FZF configuration to set silver-searcher as default
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"FZF file Finder
nnoremap <Space>f :Files<CR>

" For Fugitive Diff purposes
set diffopt+=vertical

function! s:goyo_enter()
  set spell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

"TODO: See if I can Get rid of this this
set hidden

"Insert Complete height limit
set pumheight=15

inoremap <expr> <TAB> (pumvisible() ? "\<C-n>" : "\<TAB>")
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <C-j> (pumvisible() ? "\<C-n>" : "\<C-j>")
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"Show autocomplete context in the Preveiw window
set completeopt-=preview

"""""""""""""""""""""""""
" Custom Functions
"""""""""""""""""""""""""
function SetupLightlineColors() abort
  " transparent background in statusbar
  let l:palette = lightline#palette()

  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction

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

function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl
    endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! GoToDefinition()
  Ggrep 'def \<<cword>\>' **
endfunction

function! GoToSearch()
  Ggrep '\<<cword>\>' **
endfunction

function! CreateRailsSlime()
  tabedit tmp/rails_repl_a.rb
  vsp tmp/rails_repl_b.rb
  terminal rails c
  tabn
endfunction

function! OpenScreenShot()
  let base = "tmp/screenshots/"
  let path = system("ls " . base . " -Art | tail -n 1")
  let full_command = ViewImageCommand() . " " . base . path
  execute "!" . full_command
endfunction

function! RubocopAutoFix(filepath)
  execute "! rubocop -A -c .rubocop.yml" . filepath " || rubocop -a -c.rubocop.yml" . filepath
endfunction

function! ViewImageCommand()
  if len($DEFAULT_IMG_VIEWER) > 0
    return $DEFAULT_IMG_VIEWER
  else
    return "feh"
  endif
endfunction
""""""""""""""""""""""""""""
" CUSTOM Key-bindings
""""""""""""""""""""""""""""

nnoremap <Space>cl :<C-u> nohlsearch<CR><C-l>

"Clean quick-fix window
nmap <Space>qc :cexpr []<CR>
nnoremap <C-W>q :Copen<CR>
nnoremap <Space>o :call QuickFix_toggle()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Space>l :call RunLastSpec()<CR>
nnoremap <Space>a :call RunCurrentSpecFile()<CR>
nnoremap <Space>af :Dispatch! rspec --only-failures<CR>
nnoremap <Leader>ss :silent call OpenScreenShot()<CR>

nnoremap <Space>gd :call GoToDefinition()<CR><CR>zz
nnoremap <Space>gs :call GoToSearch()<CR>
nnoremap <Space>ag :Ag<CR>
nnoremap <Space>b :Buffer<CR>
inoremap jk <ESC>

"Custom Snippets
nnoremap <Space>r :Dispatch! rubocop -a -c .rubocop.yml %<CR>
nnoremap <Space>shot :-1read ~/.vim/snippets/.screenshot.rb<CR>>>.
nnoremap <Space>here :-1read ~/.vim/snippets/.debug_puts.rb<CR>
nnoremap <Space>html :-1read ~/.vim/snippets/.write_feature_html.rb<CR>v2j>.
nnoremap <Space>dc a{ data: { controller: "" } }<ESC>F"i
nnoremap <Space>dt a{ data: { target: "" } }<ESC>F"i
nnoremap <Space>da a{ data: { action: "" } }<ESC>F"i
nnoremap <Space>dic a data: { controller: "" }<ESC>F"i
nnoremap <Space>dit a data: { target: "" } <ESC>F"i
nnoremap <Space>dia a data: { action: "" } <ESC>F"i
nnoremap <Space>scenario :-1read ~/.vim/snippets/.scenario.rb<CR>v6j>wa
nnoremap <Space>issue : !gitlab issues create "" "$(cat %)"<CR>
nnoremap <Space>ni :new tmp/issue.md<CR>3ja
nnoremap <Space>ci :w \| !gitlab issues create "" "$(cat %)" && cp -f ~/.vim/snippets/.issue.md tmp/issue.md<CR>
nnoremap <Space>mc : !gitlab comments create 'new-branch' "$(echo @%)"  "$(echo line('.'))" "$(cat %)"

""""""""""""""""""""""""""""
" Linter
""""""""""""""""""""""""""""

"Linter Signs column on the left - Warnings + Errors
set signcolumn=yes
"Make highlight transparent
au VimEnter * highlight clear SignColumn

""""""""""""""""""""""""""""
" NeoVim COC
""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-solargraph']

" TODO: I changed this to `w` from `i`
" I Don't Know if it even does anything
set complete-=w
"
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

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

"Expand Snippets using COC plug-ins
inoremap <expr> <C-e> coc#_select_confirm()

"" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.  Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

set foldenable

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h
" coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Calendar credentials
"source ~/.cache/calendar.vim/credentials.vim

"let g:calendar_google_calendar = 1

function! TaskDone()
  s/TODO/DONE/g | s/BLOCKED/DONE/g | s/→/✔️/g
endfunction

function! TaskRemove()
  . w >>
  .d
endfunction

function! TaskAdd()
endfunction

nnoremap <Space>d :call TaskDone()<CR>
nnoremap <Space>dd :call TaskRemove()<CR>
nnoremap <Space>tt oTODO -<space>
"sub-task/todo
nnoremap <Space>st o<C-K>-><space><space>

" Hide the tabline
:set showtabline=0

" Remap the default leave (Vim) terminal bindings
:tnoremap <Esc> <C-\><C-n>

"set secure

