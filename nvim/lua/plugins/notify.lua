return {
  {
    "rcarriga/nvim-notify",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      display = { "NvimNotify" },
      top_down = false,
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = {
      presets = {
        top_down = false,
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
  },
}
