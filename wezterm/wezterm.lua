local wezterm = require("wezterm")
local background = require("background")
local colorsheme = require("colorsheme")
local editor = require("editor")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

background.apply_to_config(config)
colorsheme.apply_to_config(config)
editor.apply_to_config(config)
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

return config
