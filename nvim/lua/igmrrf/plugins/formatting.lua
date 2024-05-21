return {
  {

    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },

      {
        "<leader>mp",
        function()
          require("conform").format({
            formatters = { "injected" },

            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        mode = { "n", "v" },
        desc = "Format file or range (in visual mode)",
      },
    },
    opts = {},
    config = function()
      require("conform").setup({
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shfmt" },
          javascript = { "biome" },
          javascriptreact = { "biome" },
          json = { "biome" },
          jsonc = { "biome" },
          typescript = { "biome" },
          typescriptreact = { "biome" },
          astro = { "biome" },
          svelte = { "biome" },
          vue = { "biome" },
          ["css"] = { "prettier" },
          ["scss"] = { "prettier" },
          ["less"] = { "prettier" },
          ["html"] = { "prettier" },
          ["yaml"] = { "prettier" },
          ["markdown"] = { "prettier" },
          ["markdown.mdx"] = { "prettier" },
          ["graphql"] = { "prettier" },
          ["handlebars"] = { "prettier" },
          ["python"] = { "isort", "black" },
        },
      })
    end,
  },
}
