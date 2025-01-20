-- Bootstrap packer
local packer_bootstrap = require("config.packer-bootstrap").ensure_packer()

-- Install packages
return require("packer").startup(function(use)
    -- Instruct packer to update itself
    use "wbthomason/packer.nvim"


    ------- Other Tools -------

    -- Open floating terminal
    use "voldikss/vim-floaterm"

    -- Edit files as root
    use "lambdalisue/suda.vim"

    -- Discord Rich Presence
    use "andweeb/presence.nvim"

    -- Git decorations
    use "lewis6991/gitsigns.nvim"

    -- Git integration
    use "tpope/vim-fugitive"

    -- Automatic pair insertion
    use "windwp/nvim-autopairs"

    -- Window picker
    use {
        "s1n7ax/nvim-window-picker",
        tag = "v2.*"
    }


    ------- Utility -------

    -- Highly extendable fuzzy finder over lists
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- Highlights possible key binds when starting to type
    use "folke/which-key.nvim"


    ------- Appearance and User Interface -------

    -- Base16 color themes
    use "RRethy/nvim-base16"

    -- Color highlighter
    use {
        "rrethy/vim-hexokinase",
        run = "make hexokinase"
    }

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }

    -- Improved vim.ui interface
    use "stevearc/dressing.nvim"

    -- Statusline
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    -- Tabline
    use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" }
    }


    ------- Programming languages -------

    -- Treesitter is a source code parsing library
    use "nvim-treesitter/nvim-treesitter"

    -- LSP Configuration
    use "neovim/nvim-lspconfig"

    -- Source completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        -- install jsregexp
	    run = "make install_jsregexp"
    }
    use "saadparwaiz1/cmp_luasnip"

    -- Automatically highlight uses of the symbol under the cursor
    use "RRethy/vim-illuminate"

    -- Show a lightbulb in the sign column when a textDocument/codeAction is available
    use "kosayoda/nvim-lightbulb"

    -- Creates missing LSP diagnostics highlight groups for color schemes
    -- that don"t yet support the builtin LSP client
    use "folke/lsp-colors.nvim"

    -- LSP signature help while typing
    use "ray-x/lsp_signature.nvim"

    -- Applies highlight group to unused variables and functions
    use "Kasama/nvim-custom-diagnostic-highlight"

    -- Rust Tools
    use "simrat39/rust-tools.nvim"

    -- DAP (Debug Adapter Protocol) integration
    use "mfussenegger/nvim-dap"

    -- Package manager for Language Servers, Debug Adapters etc.
    use "williamboman/mason.nvim"

    -- Integration of mason.nvim with nvim-lspconfig
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = { "neovim/nvim-lspconfig" }
    }

    -- List diagnostics
    use "onsails/diaglist.nvim"


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
