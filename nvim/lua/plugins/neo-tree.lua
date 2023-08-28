return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          never_show = {
            "node_modules",
          },
          always_show = {
            ".env",
            ".gitignore",
          },
        },
      },
    },
  },
}
