# VIM 
![vim_gruvbox_hybrid](https://github.com/user-attachments/assets/77dbd194-181e-4bbb-8f21-92cdae042097)

## Plugin Management
* Using vim-plug for plugin management

## Installed Plugins
1. **coc.nvim** - Code completion and language server protocol support
2. **NERDTree** - File explorer
3. **nerdtree-git-plugin** - Git status in NERDTree
4. **vim-nerdtree-syntax-highlight** - Syntax highlighting in NERDTree
5. **vim-devicons** - File icons
6. **vim-gitgutter** - Git diff in the gutter
7. **ctrlp.vim** - Fuzzy file finder
8. **nerdcommenter** - Code commenting
9. **vim-tmux-navigator** - Seamless tmux-vim navigation
10. **gruvbox** - Color scheme
11. **vim-airline** - Status line enhancement
12. **yats.vim** - TypeScript syntax
13. **vim-jsx-pretty** - JSX/React syntax
14. **github-nvim-theme** - GitHub color theme

## General Settings
* Dark background
* Highlight search results
* Proper backspace behavior
* DejaVu Sans font at size 12
* Mouse support enabled
* Case-insensitive search
* No error bells
* Indent-based code folding
* Line numbers enabled
* Status line shows full file path
* Tab settings (2 spaces)

## Key Mappings

### NERDTree
* `<leader>n` - Focus NERDTree
* `<C-n>` - Toggle NERDTree

### NERDCommenter
* `++` - Toggle comment (normal and visual mode)
* `<Esc>tC` - Toggle comment (normal mode)
* `<D-/>` - Toggle comment (normal and visual mode)

### Buffer Management
* `gb` - List buffers and prompt for selection

### Search and Replace
* `ge` - Yank current word and prepare for global replace

### Window Management
* `=` - Increase window width
* `-` - Decrease window width
* `<Leader>w+` - Increase window width by 5 columns
* `<Leader>w-` - Decrease window width by 5 columns
* `<Leader>t` - List tabs

### Clipboard Operations
* `<Leader>y` - Yank to system clipboard (normal and visual modes)
* `<Leader>p` - Paste from system clipboard (normal and visual modes)

### Terminal
* `<Esc>` - Exit terminal mode to normal mode

### Text Editing
* `<C-BS>` - Delete word backwards in insert mode
* `<leader>r` - Repeat last command
* `j` and `k` - Move by visual lines rather than actual lines when wrapped

### CoC (Code Completion)
* `<c-space>` - Trigger completion
* `<cr>` - Confirm completion
* `[g` and `]g` - Navigate diagnostics
* `gd` - Go to definition
* `gy` - Go to type definition
* `gi` - Go to implementation
* `gr` - Go to references
* `K` - Show documentation
* `<F2>` - Rename symbol
* `<leader>f` - Format selected region
* `<leader>a` - Code action on selected region
* `<leader>ac` - Code action on current line
* `<leader>qf` - Quick fix current line
* `if` and `af` - Function text objects
* `<C-d>` - Select selection ranges
* `<space>a` - Show all diagnostics
* `<space>e` - Manage extensions
* `<space>c` - Show commands
* `<space>o` - Document outline
* `<space>s` - Search workspace symbols
* `<space>j` - Next item
* `<space>k` - Previous item
* `<space>p` - Resume latest list

### Delete Operations
* `x`, `d`, `D` - Delete without yanking
* `<leader>d`, `<leader>D` - Delete with yanking

### Commands
* `:Format` - Format current buffer
* `:Fold` - Fold current buffer
* `:OR` - Organize imports
* `:Prettier` - Format file with Prettier

## Auto Commands
* Sync open file with NERDTree
* Highlight current symbol under cursor
* Setup format expressions for TypeScript and JSON
* Update signature help on jump placeholder

# NEOVIM

![neovim_look](https://github.com/user-attachments/assets/cf992bcf-1d6e-4dcc-84da-e205cb245f82)

## Package Management

**Using lazy.nvim for plugin management**

### Installed Plugins
- `darkbox.nvim` - Dark theme with customization
- `lsp-zero.nvim` - Simplified LSP configuration
- `mason.nvim` - Package manager for LSP servers
- `nvim-cmp` - Completion engine
  - `LuaSnip` - Snippet engine
  - `cmp-nvim-lsp` - LSP source for nvim-cmp
  - `cmp-buffer` - Buffer words source
  - `cmp-path` - Path completion
  - `cmp_luasnip` - LuaSnip integration
  - `friendly-snippets` - Snippet collection
- `nvim-lspconfig` - Language server configuration
- `mason-lspconfig.nvim` - Bridge between Mason and lspconfig
- `lualine.nvim` - Status line with icons
- `nvim-treesitter` - Advanced syntax highlighting and more
- `nvim-tree.lua` - File explorer
- `nvim-web-devicons` - Icons for UI
- `nvim-autopairs` - Auto pairs with Treesitter support
- `telescope.nvim` - Fuzzy finder and picker
- `gitsigns.nvim` - Git integration in buffers
- `Comment.nvim` - Easy code commenting

## LSP Support
- Manages servers with Mason
- Pre-configured language servers:
  - `rust_analyzer` - Rust
  - `clangd` - C/C++
  - `gopls` - Go
  - `zls` - Zig
  - `lua_ls` - Lua with Neovim configuration

## Completion Setup
- Tab to navigate completions
- Custom icons for diagnostics
- Multiple completion sources
- Snippets support

## General Settings
- Relative line numbers
- Mouse support enabled (`mouse = "a"`)
- System clipboard integration
- Smart case-insensitive search
- Visible whitespace characters
- Cursor line highlighting
- 10-line scrolloff margin
- True color terminal support
- Transparent background options

## Indentation
- Spaces instead of tabs
- 4-space indentation
- Smart indentation
- Treesitter-based indentation

## Visual Customization
- Custom line number highlighting
- Status line with icons
- Git status signs in gutter
- Terminal colors support
- Syntax highlighting with Treesitter

## Key Mappings
- Space as leader key
- File Explorer:
  - `<C-n>` - Toggle NvimTree
- Telescope:
  - `<leader>ff` - Find files
  - `<leader>fg` - Live grep
  - `<leader>fb` - List buffers
  - `<leader>fh` - Help tags
- LSP (default lsp-zero keybindings)

# EMACS
![gruber_darker_emacs](https://github.com/user-attachments/assets/c7c716cd-5139-4245-a73f-b7447eaa1559)

## Package Management

**Using package.el and use-package for package management**

### Installed Packages
- `evil` - Vim emulation for Emacs
- `evil-collection` - Evil mode integration for Emacs components
- `org` - Organization and notes system
- `treemacs` - File explorer sidebar
- `treemacs-evil` - Evil mode integration for treemacs
- `ligature` - Support for programming ligatures
- `lsp-mode` - Language Server Protocol support
- `lsp-ui` - UI enhancements for LSP
- `tree-sitter` - Incremental parsing system
- `tree-sitter-langs` - Language grammar for tree-sitter
- `rust-mode` - Rust language support
- `go-mode` - Go language support
- `zig-mode` - Zig language support
- `js2-mode` - Enhanced JavaScript editing
- `python-mode` - Enhanced Python editing
- `lua-mode` - Lua editing
- `clojure-mode` - Clojure editing
- `cc-mode` - C/C++ editing
- `company` - Text completion framework
- `which-key` - Key binding help popups
- `doom-modeline` - Enhanced mode line
- `all-the-icons` - Icons for UI elements
- Multiple themes:
  - `gruber-darker-theme` (default)
  - `zenburn-theme`
  - `gruvbox-theme`
  - `flatland-theme`
  - `planet-theme`

## General Settings
- Disabled startup screen and messages
- Starts with empty *scratch* buffer
- Hidden menu bar and toolbar
- Relative line numbers enabled
- 4-space indentation (no tabs)
- Error debugging enabled

## Evil Mode Configuration
- Full Vim emulation
- Evil collection for broader Emacs integration

## Font Configuration
- Source Code Pro font (when available)
- Ligature support for programming symbols

## UI Customization
- gruber-darker theme (default)
- Custom doom-modeline configuration:
  - Evil state indicator
  - Project-relative file paths
  - Hidden encoding indicator
  - Hidden EOL type indicator
- Time display in modeline
- Column number display
- File size indicator

## LSP Integration
- Configured for multiple languages:
  - Rust, C/C++, Go, JavaScript, Java, Python, Lua
- Enhanced UI with lsp-ui

## Org Mode
- Indented startup view

## Email
- Optional mu4e email client integration


# FONT 
I mainly rotate between these four fonts :-
1. JetBrainsMono Nerd Font
2. FiraCode Nerd Font
3. Fantasque Sans Mono
4. Source Code Pro


