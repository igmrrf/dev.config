vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

local map = vim.keymap.set

map("n", "d", '"_d')
map("n", "x", '"_x')
map("n", "md", ":m +1<CR>")
map("n", "mu", ":m -2<CR>")
map("n", "dd", '"_dd')
map("n", "<leader>w", ":w<CR>", { silent = true, desc = "Save" })
map("n", "<leader>wa", ":wa<CR>", { silent = true, desc = "Save All" })

map("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })
map("n", "<leader>qq", ":qa<CR>", { silent = true, desc = "Quit All" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })

map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

map("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>w=", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

map("n", "<leader>Ex", ":E<CR>", { desc = "Open Explorere" })

map("n", "<leader>cs", ":colorscheme<CR>", { desc = "Which color scheme is active" })
