return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "black")
            table.insert(opts.ensure_installed, "clangd")
            table.insert(opts.ensure_installed, "clang-format")
        end,
    },
}
