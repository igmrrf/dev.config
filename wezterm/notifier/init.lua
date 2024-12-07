local wezterm = require("wezterm")

local function send_notification_to_nvim(message)
	-- Get the Neovim socket address
	local nvim_socket = os.getenv("NVIM_LISTEN_ADDRESS") or "/tmp/nvim"

	-- Construct the command for snacks.nvim
	local cmd = string.format(
		[[nvim --server %s --remote-expr "require('snacks').msg('%s', {level='info'})"]],
		nvim_socket,
		message
	)

	-- Execute the command
	local success = os.execute(cmd)
	if not success then
		print("Failed to send notification to Neovim")
	end
end

local fish = "fishing man"
send_notification_to_nvim("Active Tab: " .. fish)
-- Trigger notification on an event
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- Example: Notify the active tab name
	local tab_title = tab.active_pane.title
	send_notification_to_nvim("Active Tab: " .. tab_title)
	return tab_title
end)

wezterm.on("new-tab", function(tab)
	send_notification_to_nvim("New tab created!")
end)

return send_notification_to_nvim
