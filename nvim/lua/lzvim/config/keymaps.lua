local map = vim.keymap.set

-- Custom Keys
map("n", "d", '"_d')
map("n", "md", ":m +1<CR>")
map("n", "mu", ":m -2<CR>")
map("n", "dd", '"_dd')
map("i", "jk", "<Esc>")
map("n", "sd", ":w<CR>", { silent = true, desc = "Save" })
map("n", "sa", ":wa<CR>", { silent = true, desc = "Save All" })
map("n", "ds", ":q<CR>", { silent = true, desc = "Quit" })
map("n", "<leader>nh", ":nohl<CR>", { silent = true, desc = "Clear Search History" })

map("n", "<leader>r", ":Telescope resume<CR>", { silent = true, desc = "Resume Telescope Search" })
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true, desc = "Toggle Current Line Blame" })
