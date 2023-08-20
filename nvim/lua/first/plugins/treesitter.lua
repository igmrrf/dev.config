local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	sync_install = false,
	indent = { enable = true },
	autotag = { enable = true },
	auto_install = true,
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"bash",
		"lua",
		"dockerfile",
		"markdown",
		"markdown_inline",
		"vim",
		"gitignore",
	},
})
