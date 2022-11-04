return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ------- Libraries / Dependencies -------

    use 'nvim-lua/plenary.nvim'

    -- Package manager for LSP, DAP servers etc.
    use 'williamboman/mason.nvim'

    -- Integration of mason.nvim with nvim-lspconfig
    use { 'williamboman/mason-lspconfig.nvim', requires = 'neovim/nvim-lspconfig' }


    ------- Other Tools -------

    -- Perform operations on surrounding pairs
    use 'kylechui/nvim-surround'

    -- Open floating terminal
    use 'voldikss/vim-floaterm'


    ------- Search -------

    -- Telescope, a highly extendable fuzzy finder over lists
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires =  { 'nvim-lua/plenary.nvim' }
    }

    -- Manage keymaps and commands in a more organized manner using command_center
    use {
        'FeiyouG/command_center.nvim',
        requires = { 'nvim-telescope/telescope.nvim' }
    }


    ------- Programming languages -------

    -- Treesitter for better parsing
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- LSP Configuration
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Coq (completions)
            { 'ms-jpq/coq_nvim', branch = 'coq' },

            -- 9000+ Snippets
            { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
        }
    }

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
    -- use 'chriskempson/base16-vim'
    use 'RRethy/nvim-base16'

    -- Color highlighter
    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

    -- which-key to highlight possible key binds when starting to type
    use 'folke/which-key.nvim'

    -- nvim-tree as a file explorer
    use 'nvim-tree/nvim-web-devicons'
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

    -- Improved vim.ui interface
    use 'stevearc/dressing.nvim'

    -- Statusline
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

    -- Tabline
    use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
end)
