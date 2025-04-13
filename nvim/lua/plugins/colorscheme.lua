return {
    -- Dracula Theme
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("dracula").setup({})
            -- Set the colorscheme *after* setup
            vim.cmd.colorscheme("dracula")
        end,
    },
    -- Rose Pine Theme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        lazy = false,
        opts = {
            variant = "main",
            dark_variant = "main",
        },
    },
    -- Nord Theme
    {
        "shaunsingh/nord.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            -- You can uncomment this line if you want to set it as default
            -- vim.cmd.colorscheme("nord")
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
