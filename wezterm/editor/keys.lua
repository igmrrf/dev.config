local wezterm = require("wezterm")
local action = wezterm.action
local w = require("wezterm")
local session_manager = require("plugins/wezterm-session-manager/session-manager")

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- timeout_milliseconds defaults to 1000 and can be omitted

local keys = {

	-- Session keys
	{ key = "s", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "r", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },

	-- Navigation Keys

	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

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
	--
	-- {
	-- 	key = "l",
	-- 	mods = "CTRL|CMD",
	-- 	action = action.ActivatePaneDirection("Right"),
	-- },
	--
	-- {
	-- 	key = "h",
	-- 	mods = "CTRL|CMD",
	-- 	action = action.ActivatePaneDirection("Left"),
	-- },
	-- {
	-- 	key = "j",
	-- 	mods = "CTRL|CMD",
	-- 	action = action.ActivatePaneDirection("Down"),
	-- },
	--
	-- {
	-- 	key = "k",
	-- 	mods = "CTRL|CMD",
	-- 	action = action.ActivatePaneDirection("Up"),
	-- },

	{
		key = "E",
		mods = "CTRL|SHIFT",
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

return keys
