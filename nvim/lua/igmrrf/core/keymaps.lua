local map = vim.keymap.set

map("n", "<A-b>", ':echo "Alt+b pressed"<CR>', { desc = "Echo key pressed", noremap = true, silent = true })
-- editing
map("n", "d", '"_d')
map("n", "d", '"_d')
map("n", "x", '"_x')
map("n", "dd", '"_dd')
map("n", "<leader>w", ":w<CR>", { silent = true, desc = "Save" })
map("n", "<leader>wa", ":wa<CR>", { silent = true, desc = "Save All" })
map("n", "<leader>sx", "<cmd>source %<CR>", { silent = true, desc = "Source config" })

map("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })
map("n", "<leader>qq", ":qa<CR>", { silent = true, desc = "Quit All" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- number
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- explorer
map("n", "<leader>Ex", ":E<CR>", { desc = "Open default explorer" })
map("n", "<leader>cs", ":colorscheme<CR>", { desc = "Show current colorscheme" })

-- show keys assgined
map("n", "<leader>mn", ":nmap<CR>", { desc = "Show mappings for normal mode" })
map("n", "<leader>mv", ":vmap<CR>", { desc = "Show mappings for visual mode" })
map("n", "<leader>mi", ":imap<CR>", { desc = "Show mappings for insert mode" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Close current window", remap = true })
map("n", "<leader>w=", "<C-w>=", { desc = "Make windows equal size", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window horizontally", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window vertically", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window horizontally", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window vertically", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<leader>md", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<leader>mu", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<leader>md", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<leader>mu", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>q<cr>", { desc = "Delete Buffer and Window" })
map("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Delete Buffer" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Go to last tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Go to first tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Open new tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Got to next tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "close current tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Go to previous tab" })
map("n", "<leader><tab>n", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- open lists
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- -- toggle options
map("n", "<leader>uf", ":ToggleFormat<CR>", { desc = "Toggle Auto Format (Global)" })
map("n", "<leader>uF", ":ToggleBuffFormat<CR>", { desc = "Toggle Auto Format (Buffer)" })
-- map("n", "<leader>uf", function() LazyVim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
-- map("n", "<leader>uF", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
-- map("n", "<leader>us", function() LazyVim.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() LazyVim.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>uL", function() LazyVim.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- map("n", "<leader>ul", function() LazyVim.toggle.number() end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", function() LazyVim.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() LazyVim.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
--   map( "n", "<leader>uh", function() LazyVim.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
-- end
-- map("n", "<leader>uT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })
-- map("n", "<leader>ub", function() LazyVim.toggle("background", false, {"light", "dark"}) end, { desc = "Toggle Background" })
--
