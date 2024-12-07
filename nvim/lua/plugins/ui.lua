return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    keys = {
        {
            "<leader>fe",

            function()
                require("neo-tree.command").execute({ dir = LazyVim.root() })
            end,
            desc = "Focus on Explorer NeoTree (Root Dir)",
        },
        {
            "<leader>fE",
            function()
                require("neo-tree.command").execute({ dir = vim.uv.cwd() })
            end,
            desc = "Focus on Explorer NeoTree (cwd)",
        },

        {
            "<leader>e",

            function()
                require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
            end,
            desc = "Explorer NeoTree (Root Dir)",
            remap = true,
        },
        {
            "<leader>E",

            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
            remap = true,
        },
        {
            "<leader>ge",
            function()
                require("neo-tree.command").execute({ source = "git_status", toggle = true })
            end,
            desc = "Git Explorer",
        },
        {
            "<leader>be",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true })
            end,
            desc = "Buffer Explorer",
        },
    },
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
