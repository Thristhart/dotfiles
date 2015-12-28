" general
set autoread
set viminfo^=% " remember buffer info on close

execute pathogen#infect()

" colors
syntax on
set background=dark
let base16colorspace=256
colorscheme devolved

" tabs
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set autoindent
set smartindent
set breakindent

filetype plugin on
filetype indent on


" wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc

" interface
set ruler
set cmdheight=2
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set nu

" syntax highlighting and YCM settings
let g:syntastic_check_on_open=1
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" make stuff more intuitive
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch
set incsearch

" backups are redundant when you have git
"set nobackup
"set nowb
"set noswapfile
" turn backups on for now until I remember why they annoy me
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

" restore my cursor pos when loading file
" from ev's vimrc
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"" maps

" space to search, ctrl-space to reverse search
map <space> /
map <c-space> ?
nmap <silent> <leader>hi
 \ :echo "hi<".synIDattr(synID(line("."),col("."),1),"name").'>'
 \ . ' trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
 \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
 \ <CR>:execute "highlight " .
 \ synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

"" helper functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


