set nocompatible                " Disable backwards compatibility to old-time vi

set showmatch                   " Highlight matching characters (like parenthesis)
set hlsearch                    " Highlight search results
set incsearch                   " Enable incremental search
set ignorecase                  " Case insensitive operations
set wildmode=longest,list       " Get bash-like tab completions

set mouse=v                     " Paste with middle-click
set mouse=a                     " Enable mouse clicking

set tabstop=4                   " Number of columns occupied by a tab (= 4)
set softtabstop=4               " Multiple spaces are interpreted as a tabstop, so <BS> does the right thing
set expandtab                   " Convert tabs to spaces
set shiftwidth=4                " Width for autoindents
set autoindent                  " Indent a new line the same amount as the line just typed

set number                      " Enable line numbers
" set spell                     " Enable spell checking (might require language package)
set completeopt=menu            " Don't show preview on completions

set clipboard=unnamedplus       " Use the system clipboard

set ttyfast                     " Speed up scrolling

set termguicolors               " Enable 24-bit RGB colors in the TUI

filetype plugin indent on       " Allow auto-indentation depending on file type
syntax on                       " Always enable syntax highlighting

filetype plugin on

lua << EOF
    -- Install plugins first
    require("config.plugins")

    -- Configure utility
    require("config.utility")

    -- Configure user interface
    require("config.ui")

    -- Configure programming-related functionality
    require("config.programming")
EOF
