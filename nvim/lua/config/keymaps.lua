-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<A-b>", ':echo "Alt+b pressed"<CR>', { desc = "Echo key pressed", noremap = true, silent = true })

-- editing
map("n", "d", '"_d')
map("n", "d", '"_d')
map("n", "x", '"_x')
map("n", "dd", '"_dd')

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
