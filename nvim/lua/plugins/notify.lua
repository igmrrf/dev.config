return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },

            notifier = {
                enabled = true,
                timeout = 2000, -- default timeout in ms

                top_down = false, -- place notifications from top to bottom
            },
        },
    },
}
