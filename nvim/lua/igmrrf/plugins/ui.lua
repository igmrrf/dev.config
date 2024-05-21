return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme tokyonight")
      require("tokyonight").setup()
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
