set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin("~/vimfiles/bundle/")
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin("~/.vim/bundle/")
endif

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/NerdTree'
Plugin 'godlygeek/tabular'
Plugin 'megaannum/colorschemer'
if !has("win32")
    Plugin 'Valloric/YouCompleteMe'
endif

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme solarized

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set number      "show line numbers

"display tabs and trailing spaces
set list

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.swp,*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set laststatus=2

"No line wrap
set nowrap

function! HighlightSearch()
  if &hls
    return '  H'
  else
    return ''
  endif
endfunction

"tell the term has 256 colors
set t_Co=256

"hide buffers when not displayed
set hidden

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

"Nerdtree binding/Bookmarks
nnoremap <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

"hlsearch toggle
:noremap <F4> :set hlsearch! hlsearch?<CR>

"Gui settings
if has("gui_running")
    "Settings for various platforms
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
        "disable syntastic check on save (it pops up a cmd console, annoying)
        let b:syntastic_mode="passive"
    endif

    "Initial size
    set lines=40 columns=150

    "Remove toolbars etc
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar

    "colors
    hi User1 guifg=#ffdad8  guibg=#880c0e
    hi User2 guifg=#000000  guibg=#F4905C
    hi User3 guifg=#292b00  guibg=#f4f597
    hi User4 guifg=#112605  guibg=#aefe7B
    hi User5 guifg=#051d00  guibg=#7dcc7d
    hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
    hi User8 guifg=#ffffff  guibg=#5b7fbb
    hi User9 guifg=#ffffff  guibg=#810085
    hi User0 guifg=#ffffff  guibg=#094afe
else
    "colors
    hi User1 ctermfg=15  ctermbg=91
    hi User2 ctermfg=0  ctermbg=202
    hi User3 ctermfg=88  ctermbg=222
    hi User4 ctermfg=88  ctermbg=227
    hi User5 ctermfg=88  ctermbg=143
    hi User7 ctermfg=15  ctermbg=89 cterm=bold
    hi User8 ctermfg=15  ctermbg=99
    hi User9 ctermfg=15  ctermbg=127
    hi User0 ctermfg=15  ctermbg=38
endif
