scriptencoding utf-8

" Load plugins
source ~/.vim/plugins.vim

if has("gui_running") " {{{
    syntax on           " syntax-highlighting
    set background=dark " Backgroud
    colors lucius       " Color scheme
    set guioptions=g    " Disable all GUI elements
    set guioptions+=c   " Enable Console-based dialogs for simple queries
    set guifont=Menlo\ Regular\ for\ Powerline:h13
else
    syntax on
    set t_Co=256
    set background=dark
    colors lucius

    " Disable timeout for Esc key
    set ttimeout ttimeoutlen=0 notimeout

    " Set the cursor to a vertical line in insert mode
    " and a solid block in command mode
    if $TMUX == ''
        let &t_SI = "\<Esc>P\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>P\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        " Enable resize vim splits inside tmux
        set ttymouse=xterm2
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    endif
endif
" }}}

if has('mouse') " {{{
    set mouse=a " Mouse support
    set mousemodel=popup
    set mousehide " Hide cursor when typing
endif
" }}}

if has('multi_byte') " {{{
    set listchars=tab:\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
    " Vertical split chars
    set fillchars=stl:\ ,stlnc:\ ,vert:│
    if has("linebreak")
          let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    endif
endif
" }}}

if has("autocmd") " {{{
    " Enable file type detection.
    filetype plugin indent on

    " Auto complete options for Python (we use jedi by default)
    au FileType python set omnifunc=jedi#completions

    " Auto complete options for JavaScript
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

    " Python: jedi-vim disable auto preview docs
    au FileType python setlocal completeopt-=preview

    " Python indentation
    " About nosmartindent please look this link
    " http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
    au FileType python setlocal expandtab shiftwidth=4 tabstop=8 nosmartindent nofoldenable

    " Django autocomplete options
    au FileType html set filetype=htmldjango
    au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
    au FileType htmldjango inoremap {% {%  %}<left><left><left>
    au FileType htmldjango inoremap {{ {{  }}<left><left><left>
    au FileType htmldjango inoremap {# {#  #}<left><left><left>

    " Folding by marker for vim files
    au FileType vim setlocal foldmethod=marker foldlevel=0

    " JavaScript indentation
    au FileType javascript setlocal expandtab shiftwidth=2 tabstop=8
endif
" }}}

" Autocomplete options:
" do not select the first candidate
set completeopt=menuone,longest

set confirm " Get a dialog when :q, :w, or :wq fails

let mapleader = "," " Map leader

let maplocalleader = "_" " Local leader

set hlsearch " Highlight search terms (very useful!)

set display+=lastline " Display lastline instead of @

set incsearch " Show search matches while typing

set lazyredraw " Don't redraw while executing macros (good performance config)

set laststatus=2 " Enable statusline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set smartcase " Do smart case matching when searching

set showmatch " Show matching brackets when text indicator is over them

set showcmd " Show incomplete cmds down the bottom

set noshowmode " Do not show current mode down the bottom (we use vim-airline)

set title " Show title

set acd " Vim will change the current working directory whenever you open a file

set expandtab " Use space instead of tab

set autoread " Reload files changed outside automatically

set tabstop=4 " 1 tab == 4 spaces

set shiftwidth=4

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

set wrap " Enable word wrap

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " Terminal encoding

set fileencodings=utf8,cp1251 " Supported file encodings

set number " Enable line numbers

set ruler " Always display cursor position

set hidden " A buffer becomes hidden when it is abandoned

set noswapfile " Disable swap files

set undofile " Persistent undo

set noautochdir " Change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set conceallevel=2 " Conceal level

set ttyfast " Optimize for fast terminal connections

set foldmethod=indent " Folding method by default

set foldlevel=3 " Folding level

set path=.,,**

" Store swap, backup and undo files in fixed location
set dir=/var/tmp//,/tmp//,.
set backupdir=/var/tmp//,/tmp//,.
set undodir=/var/tmp//,/tmp//,.

" Another stuff (plugins configurations, keymaps and colors)
source ~/.vim/stuff.vim
source ~/.vim/keys.vim
