local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJI",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTINE,
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

lspconfig.tsserver.setup({
  init_options = {
    disableSuggestions = true,
  },
})

lspconfig.biome.setup({
  filetypes = {
    "javascript",
    "javascript.tsx",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "astro",
    "svelte",
    "vue",
  },
  root_dir = function(fname)
    return util.root_pattern("biome.json", "biome.jsonc")(fname)
      or util.find_package_json_ancestor(fname)
      or util.find_node_modules_ancestor(fname)
      or util.find_git_ancestor(fname)
  end,
})
return {}
