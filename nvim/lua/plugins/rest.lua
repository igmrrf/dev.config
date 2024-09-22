local map = vim.keymap.set

map("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run request under cursor" })
map("n", "<leader>rn", function()
    local name = vim.fn.input("Enter request name: ")
    if name ~= "" then
        vim.cmd("Rest run " .. name)
    else
        print("no name provided.")
    end
end, { desc = "Run request with name" })
map("n", "<leader>ro", "<cmd>Rest run<cr>", { desc = "Open result pane" })
map("n", "<leader>rl", "<cmd>Rest last<cr>", { desc = "Run last request" })
map("n", "<leader>rg", "<cmd>Rest logs<cr>", { desc = "Edit logs file" })
map("n", "<leader>rc", "<cmd>Rest cookies<cr>", { desc = "Edit cookie file" })
map("n", "<leader>rh", "<cmd>Rest env show<cr>", { desc = "Show dotenv file registered" })
map("n", "<leader>rs", "<cmd>Rest env select<cr>", { desc = "Select & register .env file" })
map("n", "<leader>re", function()
    local path = vim.fn.input("Enter .env file path: ")
    if path ~= "" then
        vim.cmd("Rest env set " .. path)
    else
        print("No file provided.")
    end
end, {
    desc = "Register .env file to the current http file",
})

return {
    "rest-nvim/rest.nvim",
    -- keys = {
    --     { "<leader>rr", "<cmd>Rest run<cr>", desc = "Rest request under cursor", mode = "n" },
    --     { "<leader>ro", "<cmd>Rest run<cr>", desc = "Open result pane", mode = "n" },
    --     { "<leader>rl", "<cmd>Rest run<cr>", desc = "Run last request", mode = "n" },
    --     { "<leader>rc", "<cmd>Rest cookies<cr>", desc = "Edit cookie file", mode = "n" },
    --     { "<leader>rs", "<cmd>Rest env show<cr>", desc = "Show dotenv file registered", mode = "n" },
    --     {
    --         "<leader>re",
    --         function()
    --             local path = vim.fn.input("Enter .env file path: ")
    --             if path ~= "" then
    --                 vim.cmd("Rest env set " .. path)
    --             else
    --                 print("No file provided.")
    --             end
    --         end,
    --         desc = "Register .env file to the current http file",
    --         mode = "n",
    --     },
    -- },
    -- tree-sitter-http :TSInstall http
}
