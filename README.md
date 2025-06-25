# 🚀 Enhanced Neovim Configuration

A powerful Neovim setup based on [LazyVim](https://github.com/LazyVim/LazyVim) with extensive language server support and development tools.

## ✨ Features

- **Multi-Language LSP Support**:
  - C/C++ (clangd)
  - JavaScript/TypeScript (eslint) : working on tsserver
  - HTML/CSS
  - Ruby (solargraph) : working on it, sofar not working so good
  - Rust (rust-analyzer)
  - Python (pyright + pylsp)

- **Enhanced Development Experience**:
  - Code completion with nvim-cmp
  - Diagnostics viewer with Trouble
  - Beautiful UI with custom lualine status bar
  - Improved LSP UI with lspsaga
  - Automatic formatting with conform.nvim

- **Language-Specific Tools**:
  - Rust: Enhanced development with rust-tools.nvim
  - C/C++: Advanced features with clangd_extensions
  - TypeScript: Improved experience with typescript-tools
  - HTML/CSS: Auto-tag completion
  - Ruby: Rails support

## 🔧 Installation

1. Make sure you have Neovim 0.8+ installed
2. Clone this repository to your Neovim config directory:
   ```
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```
3. Start Neovim and let it install plugins automatically:
   ```
   nvim
   ```

## ⌨️ Key Bindings

- `gd` - Go to definition
- `gr` - Show references
- `K` - Show hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format code
- `<leader>xx` - Toggle Trouble diagnostics
- `<leader>cf` - Format buffer with conform

## 🧩 Structure

- `init.lua` - Main configuration entry point
- `lua/config/` - Core configuration files
  - `lsp.lua` - Language Server Protocol setup
  - `lazy.lua` - Plugin manager configuration
  - `options.lua` - Neovim options
  - `keymaps.lua` - Key mappings
- `lua/plugins/` - Plugin configurations
  - `lsp-installer.lua` - Automatic LSP server installation
  - `lsp-tools.lua` - LSP enhancement tools
  - `lang-specific.lua` - Language-specific plugins
  - `ui.lua` - User interface enhancements

## 📚 References

- [LazyVim Documentation](https://lazyvim.github.io)
- [Neovim Documentation](https://neovim.io/doc)
