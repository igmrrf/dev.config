return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = true,
        opts = {
            ensure_installed = {
                "html",
                "isort",
                "pylint",
                "biome",
                "cssls",
            },
        },
    },
}
