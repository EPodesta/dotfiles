" ~/.vimrc
"

" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
call vundle#begin()
" start- all plugins below
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
" Plugin 'morhetz/gruvbox'
Plugin 'sjl/badwolf'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree.git'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-two-firewatch'
Plugin '844196/lightline-badwolf.vim'
call vundle#end()


"filetype func on
filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8
" let g:Powerline_symbols = 'fancy'

set linespace=8
set guifont=Inconsolata\ 14
let Powerline_symbols = 'fancy'

" set color

colorscheme badwolf
" let g:nord_italic_comments = 1
" set background=dark
" set t_Co=16

set t_Co=256
if &term =~ '256color'
      " Disable Background Color Erase (BCE) so that color schemes work
      "   " properly within 256-color terminals
      set t_ut=
endif
" hi Normal ctermbg=none
" highlight NonText ctermbg=none
" let g:nord_background_color_256='NONE'
" lightline fix
set laststatus=2
" set t_ut=
let g:lightline = {
      \ 'colorscheme': 'badwolf',
      \ }

function! TrimWhitespace()
    let vsave = winsaveview()
    %s/\s\+$//e
    call winrestview(vsave)
endfunction

autocmd BufWritePre * :call TrimWhitespace()

" insert characters automatically
inoremap <      <><Left>
inoremap "      ""<Left>
inoremap '      ''<Left>

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<ESC>O<Tab>
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<ESC>O<Tab>
inoremap [[     [
inoremap []     []

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<ESC>O<Tab>
inoremap {{     {
inoremap {} {}

" toggle between relative and normal line numbering
" (http://vim.wikia.com/wiki/Autocomplete_with_TAB_when_typing_words)
function! ToggleNumber()
    if (&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

" toggle between relative and normal numbering
inoremap <F3> <Esc>:call ToggleNumber()<CR>
nnoremap <F3> :call ToggleNumber()<CR>

" enable or disable search highlighting
inoremap <F4> <Esc>:set hlsearch!<CR>
nnoremap <F4> :set hlsearch!<CR>

" move lines up and down
inoremap <C-Up>     <Esc>:m-2<CR>==gi
inoremap <C-Down>   <Esc>:m+1<CR>==gi
nnoremap <C-Up>     :m-2<CR>==
nnoremap <C-Down>   :m+1<CR>==
xnoremap <C-Up>     :m-2<CR>gv=gv
xnoremap <C-Down>   :m'>+<CR>gv=gv


" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>
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
set number

" use <F2> to toggle between paste mode
set pastetoggle=<F2>

" use interactive shell on vim
set shell=/bin/bash\ -i

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

" turn syntax highlighting on
syntax on

" ctrl+c for copying to external clipboard (needs +clipboard)
vnoremap <C-c> "*y
