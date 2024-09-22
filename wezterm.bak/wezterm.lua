-- -- Pull in the wezterm API
-- local mux = require("mux")
local wezterm = require("wezterm")
-- local helper = require("helper")
local background = require("background")
local colorsheme = require("colorsheme")
local editor = require("editor")
--
-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- -- In newer versions of wezterm, use the config_builder which will
-- -- help provide clearer error messages
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end
--
-- config.font = wezterm.font("JetBrains Mono", { style = "Italic", weight = "Bold", stretch = "UltraCondensed" })
-- config.enable_scroll_bar = true
-- config.min_scroll_bar_height = "2cell"
-- config.color_scheme = "tokyonight-day"
--
-- -- Modules
-- helper.apply_to_config(config)
background.apply_to_config(config)
colorsheme.apply_to_config(config)
editor.apply_to_config(config)
-- mux.apply_to_config(config)

return config

-- Things to configure
-- Font and font size
-- Background color and image
-- Colorscheme
-- mux
