-- Bind some extensions to a filetype (e.g. vert/frag/... -> glsl files)
require("config.programming.filetypes")

-- Set up diagnostic-related functionality
require("config.programming.diagnostics")

-- Set up snippets
require("config.programming.snippets")

-- Set up treesitter
require("config.programming.treesitter")

-- Set up LSP integration
require("config.programming.lsp")

-- Set up cmp text completion package
require("config.programming.cmp")

-- Set up DAP integration
require("config.programming.dap")
