return {
    -- Enable transparency and set TokyoNight as the default colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight-storm")
        end,
    },

    -- Prevent LazyVim from overriding your colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = function() end,
        },
    },
}
