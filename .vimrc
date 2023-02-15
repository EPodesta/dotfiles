" ~/.vimrc
"
set nocompatible
set path+=**
command! MakeTags !ctags --fields=+l -R .
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'rhysd/vim-grammarous'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'AlessandroYorba/Arcadia'
Plugin 'AlessandroYorba/sierra'
Plugin 'justinmk/vim-sneak'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'sheerun/vim-polyglot'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'unblevable/quick-scope'
Plugin 'mhinz/vim-startify'
Plugin 'preservim/tagbar'
Plugin 'voldikss/fzf-floaterm'
Plugin 'voldikss/vim-floaterm'
Plugin 'ryanoasis/vim-devicons'
Plugin 'bagrat/vim-buffet'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'chrisbra/csv.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'lervag/vimtex'
call vundle#end()

let g:goyo_linenr = 1
let g:coc_filetype_map = {'tex': 'latex'}
" let g:vimwiki_hl_cb_checked=2
let g:vimwiki_table_mappings = 0
autocmd FileType * let b:coc_additional_keywords = ["-",".","_"]
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'fd . $HOME --type d --hidden',
  \  'sink': 'cd'}))

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Git
nmap <silent> <leader>ci <Plug>(coc-git-chunkinfo)
nmap <silent> <leader>nc <Plug>(coc-git-nextchunk)
nmap <silent> <leader>pc <Plug>(coc-git-prevchunk)


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd ColorScheme * highlight CocFloating ctermfg=white ctermbg=black
autocmd ColorScheme * highlight CocErrorFloat ctermfg=white ctermbg=black
autocmd ColorScheme * highlight CocPumSearch ctermfg=red ctermbg=black
autocmd ColorScheme * highlight CocPumMenu ctermfg=red ctermbg=black
autocmd ColorScheme * highlight CocBold ctermfg=red
autocmd ColorScheme * highlight CocMenuSel cterm=bold ctermfg=black ctermbg=12
autocmd ColorScheme * highlight CocFloatSbar ctermfg=black ctermbg=12

" autocmd ColorScheme * highlight CocMarkdownHeader ctermfg=red

highlight Sneak guifg=black guibg='#a52a2a' ctermfg=black ctermbg=red

let g:sneak#label = 1
nmap <leader>s <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-bd-jk)

let g:gutentags_ctags_extra_args = ['--fields=+l']
" let g:ycm_collect_identifiers_from_tags_files = 1
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

autocmd ColorScheme * highlight clear Conceal

autocmd FileType vimwiki set nowrap

autocmd ColorScheme * highlight Sneak guifg=black guibg='#a52a2a' ctermfg=black ctermbg=red

augroup qs_colors
  autocmd!
  "If there is no gui colors, cterm is set to vibrant colors.
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#a52a2a' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff6347' gui=underline ctermfg=81 cterm=underline
augroup END

" function! NeomakeESlintChecker()
"   let l:npm_bin = ''
"   let l:eslint = 'eslint'

"   if executable('npm')
"     let l:npm_bin = split(system('npm bin'), '\n')[0]
"   endif

"   if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
"     let l:eslint = l:npm_bin . '/eslint'
"   endif

"   let b:neomake_javascript_eslint_exe = l:eslint
" endfunction
" autocmd FileType javascript :call NeomakeESlintChecker()

" autocmd! BufWritePost,BufReadPost * Neomake

" let g:ycm_show_diagnostics_ui = 0

" " When writing a buffer (no delay).
" call neomake#configure#automake('w')
" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" " When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" " Full config: when writing or reading a buffer, and on changes in insert and
" " normal mode (after 500ms; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

" let g:neomake_python_enabled_makers = ['pylint']
" let g:neomake_javascript_enabled_makers = ['jshint']

let g:grammarous#show_first_error = 1

" if !exists('g:ycm_semantic_triggers')
    " let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

set background=dark
scriptencoding utf-8

set linespace=8
set guifont=Fira\ Code\ Nerd\ Font:h9
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

let $FZF_DEFAULT_COMMAND = 'fd . --hidden'
let $FZF_DEFAULT_OPTS = "--bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom,
\alt-up:half-page-up,alt-down:half-page-down"

let &t_ut=''

set spell
set laststatus=2

" ======================== fonts ======================
"
" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
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

let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 1

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

nnoremap <C-g>       :NERDTreeToggle<CR>
nnoremap <C-p>       :TagbarToggle<CR>
nnoremap <leader>h   :noh<CR>
nnoremap <leader>ff  :Files<CR>
nnoremap <leader>fh  :Files ~/<CR>
nnoremap <leader>b   :Buffers<CR>
nnoremap <leader>cc  :Commits<CR>
nnoremap <leader>tn  :call Floaterm_new(input('Term Name: '))<CR>
nnoremap <leader>th  :FloatermHide!<CR>
nnoremap <leader>ts  :FloatermShow!<CR>
nnoremap <leader>tt  :Floaterms<CR>
nnoremap <leader>gc  :GrammarousCheck<CR>
nnoremap <leader>mk  :Make<CR>
nnoremap <leader>cd  :Cd<CR>
" nnoremap <leader>gt  :YcmCompleter GoTo<CR>
nmap <leader>cm      :Commands<CR>
nmap <leader>go      <Plug>(grammarous-open-info-window)
nmap <leader>gn      <Plug>(grammarous-move-to-next-error)
nmap <leader>v       :edit ~/.vimrc<CR>
nmap <leader>vl      :source ~/.vimrc<CR>
imap jk              <Esc>

let g:fzf_layout = { 'down': '30%' }
let g:floaterm_wintype='split'
let g:floaterm_height=0.3
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
" set number

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
