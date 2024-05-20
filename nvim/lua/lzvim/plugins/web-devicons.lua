return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    norg = {
                        icon = "",
                        color = "#77AA99",
                        cterm_color = "73",
                        name = "Neorg",
                    },
                    move = {
                        icon = "🎈",
                        color = "#77AA99",
                        cterm_color = "73",
                        name = "Move",
                    },
                },
            })
        end,
    },
}
