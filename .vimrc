"Basic goodness
syntax on
filetype plugin indent on
set number
set cursorline
set autoindent smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set colorcolumn=79
set spell spelllang=en_us
set foldmethod=marker

"Enable mouse for selecting/changing windows etc.
set mouse=a

"Highlight end of line whitespace.
"set list
set listchars=trail:.

"Persistant undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

"Death to unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()