local packer_bootstrap = require("config.packer-bootstrap").ensure_packer()


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ------- Libraries / Dependencies -------

    use 'nvim-lua/plenary.nvim'

    -- Package manager for LSP, DAP servers etc.
    use 'williamboman/mason.nvim'

    -- Integration of mason.nvim with nvim-lspconfig
    use {
        'williamboman/mason-lspconfig.nvim',
        requires = { 'neovim/nvim-lspconfig' }
    }

    ------- Other Tools -------

    -- Perform operations on surrounding pairs
    use 'kylechui/nvim-surround'

    -- Open floating terminal
    use 'voldikss/vim-floaterm'

    -- Edit files as root
    use 'lambdalisue/suda.vim'

    -- Discord Rich Presence
    use 'andweeb/presence.nvim'

    -- Git decorations
    use 'lewis6991/gitsigns.nvim'

    -- Git integration
    use 'tpope/vim-fugitive'

    -- Automatic pair insertion
    use 'windwp/nvim-autopairs'

    -- Automatic window resizing
    use {
        'anuvyklack/windows.nvim',
        requires = { 'anuvyklack/middleclass' }
    }

    -- Window picker
    use {
        's1n7ax/nvim-window-picker',
        tag = 'v2.*'
    }

    ------- Search -------

    -- Telescope, a highly extendable fuzzy finder over lists
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = { 'nvim-lua/plenary.nvim' }
    }


    ------- Programming languages -------

    -- Treesitter for better parsing
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP Configuration
    use 'neovim/nvim-lspconfig'

    -- Source completions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        -- install jsregexp
	    run = "make install_jsregexp"
    }
    use 'saadparwaiz1/cmp_luasnip'

    -- Automatically highlight uses of the symbol under the cursor
    use 'RRethy/vim-illuminate'

    -- Show a lightbulb in the sign column when a textDocument/codeAction
    -- is available
    use 'kosayoda/nvim-lightbulb'

    -- Create missing LSP diagnostics highlight groups for color schemes
    -- that don't yet support the builtin LS client
    use 'folke/lsp-colors.nvim'

    -- LSP signature help while typing
    use 'ray-x/lsp_signature.nvim'

    -- Apply highlight group to unused variables and functions
    use 'Kasama/nvim-custom-diagnostic-highlight'

    -- Filetype support for eww configuration language yuck
    -- (https://github.com/elkowar/eww/)
    use 'elkowar/yuck.vim'

    -- Rust Tools
    use 'simrat39/rust-tools.nvim'


    ------- Diagnostics -------

    -- List diagnostics
    use 'onsails/diaglist.nvim'


    ------- Appearance -------

    -- Base16 themes
    use 'RRethy/nvim-base16'

    -- Color highlighter
    use {
        'rrethy/vim-hexokinase',
        run = 'make hexokinase'
    }

    -- which-key to highlight possible key binds when starting to type
    use 'folke/which-key.nvim'

    -- neo-tree as a file explorer
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    }

    -- Improved vim.ui interface
    use 'stevearc/dressing.nvim'

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Tabline
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
