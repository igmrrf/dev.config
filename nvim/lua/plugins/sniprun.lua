return {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",
    -- do jsh install.sh 1j if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
    opt = {},

    keys = {
        { "<leader>rs", "<cmd>SnipRun<cr>", desc = "Run snippet" },
        { "<leader>ro", "<cmd>'<,'>SnipRun<cr>", mode = { "v" }, desc = "Run Selected snippet" },
        { "<leader>rr", "<cmd>SnipReset<cr>", desc = "Reset SnipRun" },
    },
}
