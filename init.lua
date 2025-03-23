-- Neovim config
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugin specifications
require("lazy").setup({
    -- Theme
    {
        "timmypidashev/darkbox.nvim",
        name = "darkbox",
        priority = 1000,
        config = function()
            require("darkbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "", -- empty for classic theme
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd.colorscheme("darkbox")
        end,
    },

    -- LSP Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = function()
            -- Here we will configure nvim-cmp
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                })
            })
        end
    },

    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            -- This is where we configure LSP
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'clangd',
                    'gopls',
                    'zls',
                    'lua_ls',
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })

            lsp_zero.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = '✘',
                    warn = '▲',
                    hint = '⚑',
                    info = '»'
                }
            })

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)
        end
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                },
            }
        end
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "rust", "c", "cpp", "go", "zig",
                    "python", "javascript", "typescript",
                    "html", "css", "json", "toml", "yaml",
                    "lua", "vim", "bash",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { 
                    enable = true,
                },
                autopairs = {
                    enable = true,
                },
            })
            
            -- Add indent settings
            vim.opt.cindent = true
            vim.opt.cinoptions = "l1"    -- Align brackets properly
            vim.opt.cinwords = "if,else,while,do,for,switch,case"
        end,
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = { width = 30 },
                renderer = {
                    group_empty = true,
                },
                filters = { dotfiles = true },
            })
            vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
        end,
    },

    -- Auto pairs and surrounds
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },

    -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },

    -- Git integration
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- Comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
})

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true

-- Ensure transparency
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Set completeopt
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Custom highlight groups for relative line numbers
vim.cmd([[
  highlight LineNr guifg=#666666
  highlight CursorLineNr guifg=#ffffff
]])
