local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPluging = 1

nvimtree.setup({
	git = {
		enable = true,
	},
	filters = {
		git_ignored = false,
		custom = {
			"node_modules",
		},
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				folder = {
					-- arrow_closed = "", -- arrow when folder is closed
					-- arrow_opend = "", -- arrow whne folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	view = {
		side = "left",
	},
})
