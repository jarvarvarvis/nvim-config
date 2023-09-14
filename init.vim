set nocompatible                " Disable backwards compatibility to old-time vi

set showmatch                   " Highlight matching characters (like parenthesis)
set hlsearch                    " Highlight search results
set incsearch                   " Enable incremental search
set ignorecase                  " Case insensitive operations
set wildmode=longest,list       " Get bash-like tab completions

set mouse=v                     " Paste with middle-click
set mouse=a                     " Enable mouse clicking

set tabstop=4                   " Number of columns occupied by a tab (= 4)
set softtabstop=4               " Multiple spaces are interpreted as a tabstop, 
                                " so <BS> does the right thing
set expandtab                   " Convert tabs to spaces
set shiftwidth=4                " Width for autoindents
set autoindent                  " Indent a new line the same amount as the line just typed

set number                      " Enable line numbers
" set spell                     " Enable spell checking (migh require language package)
set completeopt=menu            " Don't show preview on completions

set clipboard=unnamedplus       " Use the system clipboard

set ttyfast                     " Speed up scrolling

" set noswapfile                " Disable creation of a swap file
" set backupdir=~/.cache/vim    " Directory to store the backup files

set termguicolors               " Enable 24-bit RGB colors in the TUI

filetype plugin indent on       " Allow auto-indentation depending on file type
syntax on                       " Always enable syntax highlighting

filetype plugin on

" Neovide-specific configurations
if exists('g:neovide')
    set guifont=Source\ Code\ Pro:h7.5
    let g:transparency = 1.0
    let g:neovide_transparency = 1.0
   
    let g:neovide_scroll_animation_length = 0.2
endif

lua << EOF
    require('config.plugins')          -- load plugin configuration
  
    ---- Appearance
    require('config.telescope')        -- load telescope configuration
    require('config.nvim-tree')        -- load nvim-tree configuration
    require('config.tabline')          -- load tabline-related configuration
    require('config.statusline')       -- load galaxybar configuration
    require('config.appearance')       -- load appearance configuration
    require('config.which-key')        -- load which-key configuration first to register
                                       -- mappings for every other plugin
   
    ---- Functionality
    require('config.find')             -- load configuration related to finding stuff 
    require('config.text')             -- load plugins related to text manipulation
    require('config.floaterm')         -- load floaterm configuration
    require('config.discord')          -- load presence.nvim configuration
    require('config.version-control')  -- load configuration of version control plugins

    require('config.commander')        -- load commander.nvim configuration

    require('config.diagnostics')      -- load diagnostics related plugin configuration
    require('config.treesitter')       -- load treesitter configuration
    require('config.coq')              -- load COQ configuration before LSP
    require('config.lsp')              -- load LSP configuration
    require('config.mason')            -- load mason configuration
    
EOF
