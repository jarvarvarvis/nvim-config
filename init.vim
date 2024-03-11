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
    if vim.g.neovide then
        require('config.neovide')      -- load neovide configuration if neovim was started inside neovide
    end

    require('config.plugins')          -- load plugin configuration

    ---- Appearance
    require('config.appearance')       -- load appearance configuration

    ---- Functionality
    -- Keybinds
    require('config.which-key')        -- load which-key configuration first to register mappings for every other plugin

    -- Windows, Bars etc.
    require('config.telescope')        -- load telescope configuration
    require('config.floaterm')         -- load floaterm configuration
    require('config.file-manager')     -- load file manager configuration
    require('config.tabline')          -- load tabline-related configuration
    require('config.statusline')       -- load galaxybar configuration
    require('config.window')           -- load config related to window manipulation

    -- Text and files
    require('config.filetypes')        -- load configuration for filetype detections
    require('config.find')             -- load configuration related to finding stuff
    require('config.text')             -- load config related to text manipulation

    -- Programming languages
    require('config.diagnostics')      -- load diagnostics related plugin configuration
    require('config.treesitter')       -- load treesitter configuration
    require('config.lsp')              -- load LSP configuration
    require('config.snippets')         -- load snippet configuration (LuaSnip)
    require('config.cmp')              -- load cmp configuration after LSP
    require('config.mason')            -- load mason configuration

    -- Version Control
    require('config.version-control')  -- load configuration of version control plugins

    -- Discord
    require('config.discord')          -- load presence.nvim configuration
EOF
