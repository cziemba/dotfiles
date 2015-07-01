" Vim > vi
set nocompatible
filetype off
set encoding=utf-8

" ============================================================================
" Vundle set up

" Platform specific paths
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin("~/vimfiles/bundle/")
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin("~/.vim/bundle/")
endif

" Vundle (duh)
Plugin 'gmarik/Vundle.vim'
" Solarized colorscheme
Plugin 'altercation/vim-colors-solarized'
" Code checker
Plugin 'scrooloose/syntastic'
" In-Vim filebrowser
Plugin 'scrooloose/NerdTree'
" Neaten code
Plugin 'godlygeek/tabular'
" Display number of search results
Plugin 'IndexedSearch'
" CodeCompletion (if not on windows)
if !has("win32")
    Plugin 'Valloric/YouCompleteMe'
endif

call vundle#end()

" ============================================================================
" GUI specific Vim settings

if has("gui_running")
    " Settings for various platforms
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
        " Disable syntastic check on windows (spawns a cmd)
        let b:syntastic_mode="passive"
    endif

    " Initial size
    set lines=40 columns=150

    " Remove toolbars etc
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar
endif

" ============================================================================
" Vim Settings

" Plugins and indentation by filetype
filetype plugin indent on

" Syntax highlighting
syntax enable

" Dark Background, use solarized
set background=dark
colorscheme solarized

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store cmdline history
set history=1000

" Show information about current command at bottom
set showcmd

" Show current mode at bottom
set showmode

" Line numbers
set number

" Display tabs and trailing spaces
set listchars=tab:▸\ ,trail:·,nbsp:_
set list

" Incremental search (as you type) / Highlight by default
set incsearch
set hlsearch

" Don't wrap lines by default / Enable smart wrapping
set nowrap
set linebreak

" Default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Folding settings, Disable folding by default
set foldmethod=indent
set foldnestmax=1
set nofoldenable

" Vim command tab completion like bash
set wildmode=list:longest
set wildmenu
set wildignore=*.swp,*.o,*.obj,*~

" Scroll settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Mouse settings for terminal
set mouse=a
set ttymouse=xterm2

" Tell the term has 256 colors
set t_Co=256

" Hide buffers when not displayed
set hidden

" Spell check when writing commit logs
autocmd filetype *commit* setlocal spell

" ============================================================================
" Hexmode (http://vim.wikia.com/wiki/Improved_Hex_editing)

command! -nargs=* Hexmode call ToggleHex()
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" ============================================================================
" Status line settings

" Status line
set statusline=                                           " Clear
set statusline+=%7*\[%n]                                  " buffernr
set statusline+=%1*\ %<%F\                                " File+path
set statusline+=%2*\ %y\                                  " FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      " Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            " Encoding2
set statusline+=%4*\ %{&ff}\                              " FileFormat (dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  " Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             " Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            " Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      " Modified? Readonly? Top/bot.
set laststatus=2

" Additional Colors
" (must be after any colorscheme settings or these will be cleared)
hi User1 ctermfg=224 ctermbg=88  guifg=#ffdad8 guibg=#880c0e
hi User2 ctermfg=16  ctermbg=209 guifg=#000000 guibg=#F4905C
hi User3 ctermfg=234 ctermbg=228 guifg=#292b00 guibg=#f4f597
hi User4 ctermfg=233 ctermbg=156 guifg=#112605 guibg=#aefe7B
hi User5 ctermfg=232 ctermbg=114 guifg=#051d00 guibg=#7dcc7d
hi User7 ctermfg=231 ctermbg=88  guifg=#ffffff guibg=#880c0e gui=bold cterm=bold
hi User8 ctermfg=231 ctermbg=67  guifg=#ffffff guibg=#5b7fbb
hi User9 ctermfg=231 ctermbg=90  guifg=#ffffff guibg=#810085
hi User0 ctermfg=231 ctermbg=27  guifg=#ffffff guibg=#094afe

" Is highlight search enabled
function! HighlightSearch()
  if &hls
    return '  H'
  else
    return ''
  endif
endfunction

" Highlight search result toggle
:noremap <F4> :set hlsearch! hlsearch?<CR>

" ============================================================================
" Plugin Settings

" Syntastic ---------------------------

" Check on open
let g:syntastic_check_on_open=1

" NERDTree ----------------------------

" F2 Open NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
" Show bookmarks by default
let NERDTreeShowBookmarks=1
" Filter out these types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" python-mode -------------------------

" Disable python-mode syntax checking (using Syntastic)
let g:pymode_lint=0
let g:pymode_lint_signs=0
" Don't fold python code on open
let g:pymode_folding=0
" Don't load rope by default.
let g:pymode_rope=0

" YouCompleteMe -----------------------

" Auto close documentation window
let g:ycm_autoclose_preview_window_after_completion=1
