local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })

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

-- NEORG Keymaps
map(
  "n",
  "<leader>nn",
  ":Neorg keybind norg core.dirman.new.note<CR>",
  { silent = true, desc = "Create New Neorg Note" }
)
map("n", "<leader>nmn", ":Neorg mode norg<CR>", { silent = true, desc = "Switch To Norg Neorg Mode" })
map(
  "n",
  "<leader>nmt",
  ":Neorg mode traverse-heading<CR>",
  { silent = true, desc = "Switch To Traverse-Heading Neorg Mode" }
)
map("n", "<leader>nj", ":Neorg journal today<CR>", { silent = true, desc = "Journal" })
map("n", "<leader>ni", ":Neorg index<CR>", { silent = true, desc = "Go to Index file within workspace" })
map("n", "<leader>nr", ":Neorg return<CR>", { silent = true, desc = "Close all Neorg buffers" })

-- Harpoon Setup
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

vim.keymap.set("n", "<leader>hl", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
end, { desc = "Add file to harpoon" })
-- vim.keymap.set("n", "<C-e>", function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)

-- vim.keymap.set("n", "<C-h>", function()
--   harpoon:list():select(1)
-- end)
-- vim.keymap.set("n", "<C-t>", function()
--   harpoon:list():select(2)
-- end)
-- vim.keymap.set("n", "<C-n>", function()
--   harpoon:list():select(3)
-- end)
-- vim.keymap.set("n", "<C-s>", function()
--   harpoon:list():select(4)
-- end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)
