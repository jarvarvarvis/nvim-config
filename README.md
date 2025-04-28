# nvim-config
My Neovim configuration

## Installation

Clone this repository into your Neovim configuration path (on most Linux distributions, this is `~/.config/nvim`).

Before running Neovim, ensure that the following dependencies are installed:
- ripgrep (for `Telescope live_grep`)
- npm for Language Servers
- Rust source code (only needed for full stdlib completions, can be installed using `rustup component add rust-src`)
- clang (for clangd)
- tree-sitter command line interface
- lldb (if you want to use the DAP integration)

Then, start Neovim using `nvim` in the terminal or in any other way.

## Useful commands

`PackerUpdate`: update packages

`Mason`: manage installed language servers / debug adapters / linters / formatters

`MasonUpdate`: update language servers / debug adapters / linters / formatters

`TSUpdate`: update treesitter grammars
