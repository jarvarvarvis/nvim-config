set nocompatible		        " disable backwards compatibility to old-time vi

set showmatch			        " highligh matching characters (like parenthesis)
set hlsearch			        " highlight search results
set incsearch			        " enable incremental search
set ignorecase			        " case insensitive operations
set wildmode=longest,list	    " get bash-like tab completions

set mouse=v		    	        " paste with middle-click
set mouse=a			            " enable mouse clicking

set tabstop=4			        " number of columns occupied by a tab (= 4)
set softtabstop=4		        " multiple spaces are interpreted as a tabstop, 
				                " so <BS> does the right thing
set expandtab			        " convert tabs to spaces
set shiftwidth=4		        " width for autoindents
set autoindent			        " indent a new line the same amount as the line just typed

set number			            " enable line numbers
" set spell			            " enable spell checking (migh require language package)
set completeopt=menu            " don't show preview on completions

set clipboard=unnamedplus	    " use the system clipboard

set ttyfast			            " speed up scrolling

" set noswapfile		        " disable creation of a swap file
" set backupdir=~/.cache/vim	" directory to store the backup files

set termguicolors               " enable 24-bit RGB colors in the TUI

filetype plugin indent on	    " allow auto-indentation depending on file type
syntax on			            " always enable syntax highlighting

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
    require('config.find')            -- load configuration related to finding stuff 
    require('config.text')             -- load plugins related to text manipulation
   
    require('config.diagnostics')      -- load diagnostics related plugin configuration
    require('config.treesitter')       -- load treesitter configuration
    require('config.coq')              -- load COQ configuration before LSP
    require('config.lsp')              -- load LSP configuration
    require('config.mason')            -- load mason configuration
    
EOF
