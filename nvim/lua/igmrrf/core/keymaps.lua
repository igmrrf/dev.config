local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })

map("n", "<leader>e", ":Neotree<CR>", { desc = "Go to left window", remap = true })
-- Custom Keys
map("n", "d", '"_d')
map("n", "md", ":m +1<CR>")
map("n", "mu", ":m -2<CR>")
map("n", "dd", '"_dd')
map("i", "jk", "<Esc>")
-- map("n", "<leader>ef", ":Neotree<CR>", { silent = true })
map("n", "sd", ":w<CR>", { silent = true, desc = "Save" })
map("n", "sa", ":wa<CR>", { silent = true, desc = "Save All" })
map("n", "ds", ":q<CR>", { silent = true, desc = "Quit" })
map("n", "<leader>nh", ":nohl<CR>", { silent = true, desc = "Clear Search History" })
map("n", "<leader>r", ":Telescope resume<CR>", { silent = true, desc = "Resume Telescope Search" })
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true, desc = "Toggle Current Line Blame" })

map("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
end, {
  desc = "Explorer Neotree",
  silent = true,
})
