return {
	{

		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"n",
				"<leader>S",
				'<cmd>lua require("spectre").toggle()<CR>',
				desc = "Toggle Spectre",
			},

			{
				"n",
				"<leader>sw",
				'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
				desc = "Search current word",
			},
			{
				"v",
				"<leader>sw",
				'<esc><cmd>lua require("spectre").open_visual()<CR>',
				desc = "Search current word",
			},

			{
				"n",
				"<leader>sp",
				'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
				desc = "Search on current file",
			},
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in Files (Spectre)",
			},
		},
	},
}
