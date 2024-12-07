local wezterm = require("wezterm")
local action = wezterm.action
local navigatorKeys = require("navigaotr")
local resurrectKeys = require("resurrect")

local function merge_tables(t1, t2)
	for _, v in ipairs(t2) do
		table.insert(t1, v)
	end
end

local keys = {

	-- Pane keys
	{ key = "0", mods = "CTRL", action = action.PaneSelect },
	{
		key = "}",
		mods = "CTRL",
		action = action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},

	{
		key = "{",
		mods = "CTRL",
		action = action.PaneSelect({
			mode = "SwapWithActiveKeepFocus",
		}),
	},

	{
		key = "[",
		mods = "CTRL",
		action = action.PaneSelect({
			mode = "MoveToNewWindow",
		}),
	},

	{
		key = "]",
		mods = "CTRL",
		action = action.PaneSelect({
			mode = "MoveToNewTab",
		}),
	},

	{
		key = "]",
		mods = "CTRL",
		action = action.PaneSelect({
			mode = "MoveToNewTab",
		}),
	},

	-- This will create a new split and run your default program inside it
	{
		key = "\\",
		mods = "ALT",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- This will create a new split and run your default program inside it
	{
		key = "-",
		mods = "ALT",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "e",
		mods = "LEADER",
		action = action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	{
		key = "m",
		mods = "CTRL",
		action = action.TogglePaneZoomState,
	},

	{
		key = "w",
		mods = "CTRL|CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	{
		key = "w",
		mods = "CTRL",
		action = action.CloseCurrentPane({ confirm = true }),
	},
}

-- Navigation Keys
merge_tables(keys, navigatorKeys)

-- Session Keys
merge_tables(keys, resurrectKeys)

return keys
