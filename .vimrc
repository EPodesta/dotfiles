" ~/.vimrc
"

set nocompatible
set path+=**

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'rhysd/vim-grammarous'
Plugin 'vimwiki/vimwiki'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'AlessandroYorba/Arcadia'
Plugin 'AlessandroYorba/sierra'
Plugin 'justinmk/vim-sneak'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'neomake/neomake'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'unblevable/quick-scope'
Plugin 'mhinz/vim-startify'
Plugin 'preservim/tagbar'
Plugin 'lervag/vimtex'
Plugin 'voldikss/fzf-floaterm'
Plugin 'voldikss/vim-floaterm'
Plugin 'ryanoasis/vim-devicons'
Plugin 'bagrat/vim-buffet'
Plugin 'tpope/vim-dispatch'
call vundle#end()

let g:sneak#label = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

autocmd ColorScheme * highlight clear Conceal

autocmd ColorScheme * highlight Sneak guifg=black guibg='#a52a2a' ctermfg=black ctermbg=red

augroup qs_colors
  autocmd!
  "If there is no gui colors, cterm is set to vibrant colors.
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#a52a2a' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff6347' gui=underline ctermfg=81 cterm=underline
augroup END

function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction
autocmd FileType javascript :call NeomakeESlintChecker()

autocmd! BufWritePost,BufReadPost * Neomake

let g:ycm_show_diagnostics_ui = 0

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_javascript_enabled_makers = ['jshint']

let g:grammarous#show_first_error = 1

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

set background=dark
scriptencoding utf-8

set linespace=8
set guifont=Hack:h9
set encoding=UTF-8
set clipboard=unnamedplus

" set color
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:arcadia_Twilight = 1
let g:sierra_Twilight = 1
colorscheme sierra

let $FZF_DEFAULT_COMMAND = 'find .'
let &t_ut=''

set laststatus=2
set spell
let g:airline_theme = 'minimalist'

" ======================== fonts ======================
"
" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer guifg=#d0d0d0 guibg=#1c1c1c gui=NONE ctermfg=252 ctermbg=234 cterm=NONE
    hi! BuffetActiveBuffer guifg=#4e4e4e guibg=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi! BuffetBuffer guifg=#4e4e4e guibg=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi! BuffetTrunc guifg=#4e4e4e guibg=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi! BuffetTab guifg=#d0d0d0 guibg=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
endfunction

" ================ Turn Off Swap Files ==============
"
set noswapfile
set nobackup
set nowb
set splitbelow
set splitright

function! TrimWhitespace()
    let vsave = winsaveview()
    %s/\s\+$//e
    call winrestview(vsave)
endfunction

autocmd BufWritePre * :call TrimWhitespace()

set hlsearch!

" move lines up and down
inoremap <C-Up>     <Esc>:m-2<CR>==gi
inoremap <C-Down>   <Esc>:m+1<CR>==gi
nnoremap <C-Up>     :m-2<CR>==
nnoremap <C-Down>   :m+1<CR>==
xnoremap <C-Up>     :m-2<CR>gv=gv
xnoremap <C-Down>   :m'>+<CR>gv=gv

nnoremap <C-J>      <C-W><C-J>
nnoremap <C-K>      <C-W><C-K>
nnoremap <C-H>      <C-W><C-H>
nnoremap <C-L>      <C-W><C-L>

let g:floaterm_shell='zsh'

function! Floaterm_new(name)
  let l:term_name = a:name
  if len(l:term_name) == 0
    execute ':FloatermNew'
  else
    execute ':FloatermNew --title=' . l:term_name
  endif
endfunction

let g:fzf_floaterm_newentries = {
  \ '+root' : {
    \ 'title': 'Shell',
    \ 'cmd' : '' },
  \ }

nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <C-p> :TagbarToggle<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :Files ~/<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>cc :Commits<CR>
nnoremap <leader>tn :call Floaterm_new(input('Term Name: '))<CR>
nnoremap <leader>th :FloatermHide!<CR>
nnoremap <leader>ts :FloatermShow!<CR>
nnoremap <leader>tt :Floaterms<CR>
nnoremap <leader>gc :GrammarousCheck<CR>
vnoremap <leader>gc :GrammarousCheck<CR>
nnoremap <leader>mk :Make<CR>
nmap <leader>cm :Commands<CR>
nmap <leader>go <Plug>(grammarous-open-info-window)
nmap <leader>gn <Plug>(grammarous-move-to-next-error)
let NERDTreeShowHidden=1

" keep indent from previous line if no filetype indent is specified
set autoindent

" allow backspace over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" ruler at 80 characters
" set colorcolumn=80

" confirm quit
set confirm

" highlight current line
set cursorline
" expand tabs to spaces
set expandtab

" better undo history
set hidden

" case insensitive search
set ignorecase

" redraw only when needed
set lazyredraw

" enable mouse usage
set mouse=a

" don't always go to first character of line
set nostartofline

" show line numbers on the left
set number relativenumber

" use <F2> to toggle between paste mode
set pastetoggle=<F2>

" use interactive shell on vim
" This crashes tagbar
" set shell=/bin/bash\ -i

" 1 tab equals four spaces
set shiftwidth=4

" partial commands in last line of screen
set showcmd

" if a pattern has a capital letter then it is case sensitive
set smartcase

" display tabs as four characters wide
set tabstop=4

" better command-line completion
set wildmenu

" set indent
set textwidth=80

" turn syntax highlighting on
syntax on

" ctrl+c for copying to external clipboard (needs +clipboard)
vnoremap <C-c> "*y
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
