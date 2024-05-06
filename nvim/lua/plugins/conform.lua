return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      ---@type table<string, conform.FormatterUnit[]>
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
        ["python"] = { "black" },
      },
    },
  },
}
