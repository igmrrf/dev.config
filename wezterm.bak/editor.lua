local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	config.font = wezterm.font("JetBrains Mono", { weight = "Regular", italic = true })
	config.font_size = 12.5
	config.window_decorations = "RESIZE"
end

return module
