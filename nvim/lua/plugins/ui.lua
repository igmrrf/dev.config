return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    opts = {
        window = {
            position = "right",
        },
        file_system = {
            hide_dotfiles = false,

            filtered_items = {
                always_show = {
                    "env",
                },
            },
        },
    },
}
