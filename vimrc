let mapleader = "\<Space>"        " Set leader to space.

set nocompatible                  " Must come first because it changes other options.
filetype off                      " Required by vundle.

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize.
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " Let vundle manage vundle.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'         " Supercharge vim’s dot command.
Plugin 'thoughtbot/vim-rspec'     " Run rspec from within vim.
Plugin 'tpope/vim-dispatch'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tmhedberg/matchit'
Plugin 'kana/vim-textobj-user'          " Ruby block text object dependency
Plugin 'nelstrom/vim-textobj-rubyblock' " Ruby block text object
Plugin 'tpope/vim-rails'
Plugin 'rking/ag.vim'                   " Search using ag
Plugin 'tpope/vim-endwise'
Plugin 'kchmck/vim-coffee-script'
Plugin 'gcmt/taboo.vim'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'mitermayer/vim-prettier'
Plugin 'jparise/vim-graphql'
Plugin 'leafgarland/typescript-vim'

call vundle#end()

" let g:ackprg = 'ag --vimgrep'
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrp_use_caching = 0        " Disable ctrp file listing cache.
let g:ctrlp_custom_ignore = '\v[\/](__generated__|node_modules|target|dist)|(\.(swp|ico|git|svn))$'

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you’re in.

set backspace=indent,eol,start    " Intuitive backspacing.

if $TMUX == ''
  set clipboard+=unnamed             " Tell vim to use system clipboard
endif

set hidden                        " Handle multiple buffers better.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains uppercase letters.
set smarttab

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal’s title.

set visualbell                    " No beeping.

set nobackup                      " Don’t make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swapfiles in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs.

set pastetoggle=<Leader>pt

set laststatus=2                  " Show the status line all the time.
set relativenumber
highlight StatusLine ctermfg=blue ctermbg=yellow  " Highlight the status line.

set cursorline
highlight CursorLine cterm=NONE ctermbg=Black

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

imap § <Esc>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>

nmap <Leader>- :nohlsearch<CR>

let g:rspec_command = "Dispatch bin/rspec {spec}" " Use tpope/dispatch to run thoughtbot/vim-rspec
:nnoremap H :set cursorline!<CR>

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb,*.scss,*.coffee,*.haml :%s/\s\+$//e

let g:jsx_ext_required = 0

autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd VimEnter * wincmd p

" Prettier config
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'

" Run Prettier before saving
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
