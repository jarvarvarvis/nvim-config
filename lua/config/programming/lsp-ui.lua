local M = {}

function M.setup()
    -- Configure borders
    local borders = require("config.utility.borders")

    -- Configure border in floating previews (hover, signatureHelp)
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or borders.table_clockwise_from_top_left
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Configure LspInfo border
    require("lspconfig.ui.windows").default_options = {
        border = borders.table_clockwise_from_top_left,
    }


    -- Setup lsp_signature plugin
    require("lsp_signature").setup {
        bind = true,
        handler_opts = {
            border = borders.table_clockwise_from_top_left
        }
    }

    -- Setup lsp-colors
    require("lsp-colors").setup {
        Error = "#cc6666",
        Warning = "#f0c674",
        Information = "#81a2be",
        Hint = "#8abeb7",
    }

    -- Setup nvim-custom-diagnostic-highlight plugin
    vim.cmd [[highlight UnusedHighlightGroup ctermfg=gray guifg=gray]]

    require("nvim-custom-diagnostic-highlight").setup {
        register_handler = true,
        highlight_group = "UnusedHighlightGroup",
        diagnostic_handler_namespace = "unused_handler"
    }

    -- Setup nvim-lightbulb plugin
    require("nvim-lightbulb").setup {
        sign = {
            enabled = true,
            priority = 10
        }
    }

    vim.cmd [[autocmd CursorHold,CursorHoldI * lua require("nvim-lightbulb").update_lightbulb()]]
end

return M
