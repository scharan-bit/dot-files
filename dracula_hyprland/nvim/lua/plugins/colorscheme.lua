return {
    -- Gruvbox Theme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("gruvbox").setup({})
            -- Set Gruvbox as the default colorscheme
            --     vim.cmd.colorscheme("gruvbox")
        end,
    },
    -- Dracula Theme
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("dracula").setup({
                -- customize dracula color palette
                colors = {
                    -- customize dracula colors
                    -- bg = "#282A36",
                    -- fg = "#F8F8F2",
                    -- selection = "#44475A",
                    -- comment = "#6272A4",
                    -- red = "#FF5555",
                    -- orange = "#FFB86C",
                    -- yellow = "#F1FA8C",
                    -- green = "#50fa7b",
                    -- purple = "#BD93F9",
                    -- cyan = "#8BE9FD",
                    -- pink = "#FF79C6",
                },
                -- show the '~' characters after the end of buffers
                show_end_of_buffer = true,
                -- use transparent background
                transparent_bg = false,
                -- set custom lualine background color
                lualine_bg_color = nil,
                -- set italic comment
                italic_comment = true,
                -- enable overrides for nvim-cmp plugin
                overrides = {},
            })
            -- Uncomment to use as default theme
            vim.cmd.colorscheme("dracula")
        end,
    },
    -- Disable LazyVim from setting the colorscheme automatically
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = function() end, -- prevents LazyVim from overriding your setup
        },
    },
}
