-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>ef", ":Neotree<CR>", { silent = true })
vim.keymap.set("n", "sd", ":w<CR>", { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true, desc = "Clear Search Historyh" })
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- map("n", "<leader>dpr", ["<leader>dpr"] = {
--       function()
--         require('dap-python').test_method()
--       end
--     })
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })
