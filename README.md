# nvim-config
My Neovim configuration

## Installation

Clone this repository into your Neovim configuration path (on most Linux distributions, this is `~/.config/nvim`).

Before running Neovim, you need to install the following dependencies:
- potentially npm for Language Servers
- ripgrep (`Telescope live_grep`)
- Rust source code (needed for full completions, `rustup component add rust-src`)
- lldb (if you want to use the DAP integration)

Then, start Neovim using `nvim` in the terminal or in any other way.
