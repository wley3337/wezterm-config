local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.apply_to_config(config)
	-- regex for sorting end of line to first `.`: < /[^.]*$/r >
	-- disable all key bindings so that we can chose what we need below
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1800 }
	-- disable all key bindings to define just what I want to use. Easier then managing
	-- collisions with NVIM, etc.
	config.disable_default_key_bindings = true
	config.keys = {
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by      the tab
		-- defaults

		-- ******* WINDOW ******* {{{
		{ key = "W", mods = "LEADER", action = act.SpawnWindow },
		-- }}}

		-- ******* TABS ******* {{{
		{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
		{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
		{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
		{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
		{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
		{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
		{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
		{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
		{ key = "H", mods = "LEADER|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "L", mods = "LEADER|SHIFT", action = act.ActivateTabRelative(1) },
		{ key = "X", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "LeftArrow", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
		{ key = "RightArrow", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },
		{ key = "T", mods = "LEADER|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
		-- }}}
		-- ******* PANE ******* {{{
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "LeftArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "f", mods = "LEADER", action = act.TogglePaneZoomState },
		-- }}}

		-- ******* SPLITS ******* {{{
		{ key = "-", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- }}}

		-- ******* FONTS ******* {{{
		{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
		{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
		-- }}}

		-- ******* COPY/PASTE ******* {{{
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{
			key = "u",
			mods = "SHIFT|CTRL",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
		{ key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
		-- { key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
		-- }}}
		-- ******* SEARCH ******* {{{
		{ key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
		-- }}}

		-- ******* SCROLLBACK ******* {{{
		{ key = "K", mods = "CTRL", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		-- }}}

		-- ******* APPLICATION ******* {{{
		{ key = ":", mods = "LEADER", action = act.ActivateCommandPalette },
		-- { key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
		-- }}}

		-- ******* SPAWN ******* {{{
		{
			key = "F1",
			mods = "",
			action = wezterm.action_callback(function(win, current_pane)
				-- spawn tab
				win:mux_window():spawn_tab({
					cwd = "/Users/hal/Documents/dev/learning/",
					label = "Learning",
				})
				local tab = win:active_tab()

				-- set tab's title
				tab:set_title("Learning")

				local pane = tab:active_pane()
				local code = pane:split({
					direction = "Right",
					size = 0.75,
				})
				-- set active cursor to the code split
				code:activate()
			end),
		},

		-- }}}
	}

	config.key_tables = {
		copy_mode = {
			{ key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "a", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			{ key = "i", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "Home", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{
				key = "y",
				mods = "NONE",
				action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
			},
		},

		search_mode = {
			{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
			{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("NextMatch") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("NextMatchPage") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PriorMatchPage") },
		},
	}
end

return M
