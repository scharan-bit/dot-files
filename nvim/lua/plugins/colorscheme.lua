return {
  -- GitHub Theme
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    lazy = false,
    config = function()
      require("github-theme").setup({
        -- Optional configuration
      })
    end,
  },
  -- Dracula Theme
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    lazy = false,
  },
  -- Rose Pine Theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    opts = {
      variant = "main", -- Using the main variant, not moon
      dark_variant = "main",
    },
  },
  -- Configure LazyVim to use one of these themes
  {
    "LazyVim/LazyVim",
    opts = {
      -- Set your default theme here
      colorscheme = "dracula", -- or "dracula" or "rose-pine" or "tokyonight"
    },
  },
}
