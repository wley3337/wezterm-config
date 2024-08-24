local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.apply_to_config(config)
	-- regex for sorting end of line to first `.`: < /[^.]*$/r >
	-- disable all key bindings so that we can chose what we need below
	config.leader = { key = "a", mods = "CTRL" }
	config.disable_default_key_bindings = true
	config.keys = {
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by      the tab
		-- defaults
		-- ******* TABS ******* {{{
		{ key = "(", mods = "CTRL", action = act.ActivateTab(-1) },
		{ key = "(", mods = "SHIFT|CTRL", action = act.ActivateTab(-1) },
		{ key = "9", mods = "SHIFT|CTRL", action = act.ActivateTab(-1) },
		{ key = "9", mods = "SUPER", action = act.ActivateTab(-1) },
		-- { key = "!", mods = "CTRL", action = act.ActivateTab(0) },
		-- { key = "!", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
		{ key = "1", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
		{ key = "1", mods = "SUPER", action = act.ActivateTab(0) },
		{ key = "2", mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
		{ key = "2", mods = "SUPER", action = act.ActivateTab(1) },
		{ key = "@", mods = "CTRL", action = act.ActivateTab(1) },
		{ key = "@", mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
		{ key = "#", mods = "CTRL", action = act.ActivateTab(2) },
		{ key = "#", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
		{ key = "3", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
		{ key = "3", mods = "SUPER", action = act.ActivateTab(2) },
		{ key = "$", mods = "CTRL", action = act.ActivateTab(3) },
		{ key = "$", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
		{ key = "4", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
		{ key = "4", mods = "SUPER", action = act.ActivateTab(3) },
		{ key = "%", mods = "CTRL", action = act.ActivateTab(4) },
		{ key = "%", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
		{ key = "5", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
		{ key = "5", mods = "SUPER", action = act.ActivateTab(4) },
		{ key = "6", mods = "SHIFT|CTRL", action = act.ActivateTab(5) },
		{ key = "6", mods = "SUPER", action = act.ActivateTab(5) },
		{ key = "^", mods = "CTRL", action = act.ActivateTab(5) },
		{ key = "^", mods = "SHIFT|CTRL", action = act.ActivateTab(5) },
		{ key = "&", mods = "CTRL", action = act.ActivateTab(6) },
		{ key = "&", mods = "SHIFT|CTRL", action = act.ActivateTab(6) },
		{ key = "7", mods = "SHIFT|CTRL", action = act.ActivateTab(6) },
		{ key = "7", mods = "SUPER", action = act.ActivateTab(6) },
		{ key = "*", mods = "CTRL", action = act.ActivateTab(7) },
		{ key = "*", mods = "SHIFT|CTRL", action = act.ActivateTab(7) },
		{ key = "8", mods = "SHIFT|CTRL", action = act.ActivateTab(7) },
		{ key = "8", mods = "SUPER", action = act.ActivateTab(7) },
		-- { key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "{", mods = "SUPER", action = act.ActivateTabRelative(-1) },
		{ key = "{", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
		{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "[", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
		{ key = "Tab", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "}", mods = "SUPER", action = act.ActivateTabRelative(1) },
		{ key = "}", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
		{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "]", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
		{ key = "W", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "PageUp", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
		{ key = "PageDown", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
		{ key = "T", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "t", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
		-- { key = "f", mods = "LEADER", action = act.ToggleFullScreen },
		-- }}}
		-- ******* PANE ******* {{{

		{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "LeftArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "Z", mods = "CTRL", action = act.TogglePaneZoomState },
		{ key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
		{ key = "z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
		-- }}}

		-- ******* SPLITS ******* {{{

		{ key = "%", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "%", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "5", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- { key = '-', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "'", mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- }}}
		-- ******* FONTS ******* {{{

		{ key = "_", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
		{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
		{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "=", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "=", mods = "SUPER", action = act.IncreaseFontSize },
		{ key = ")", mods = "CTRL", action = act.ResetFontSize },
		{ key = ")", mods = "SHIFT|CTRL", action = act.ResetFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
		{ key = "0", mods = "SUPER", action = act.ResetFontSize },
		-- }}}
		-- ******* COPY/PASTE ******* {{{

		{ key = "X", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
		{
			key = "u",
			mods = "SHIFT|CTRL",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
		{
			key = "U",
			mods = "CTRL",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
		{
			key = "U",
			mods = "SHIFT|CTRL",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
		{ key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
		{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
		--	{ key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
		-- }}}
		-- ******* SEARCH ******* {{{

		{ key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "f", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
		-- }}}

		-- ******* WINDOW ******* {{{
		{ key = "N", mods = "CTRL", action = act.SpawnWindow },
		{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
		{ key = "n", mods = "SHIFT|CTRL", action = act.SpawnWindow },
		{ key = "n", mods = "SUPER", action = act.SpawnWindow },
		-- }}}

		-- ******* SCROLLBACK ******* {{{
		{ key = "k", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "K", mods = "CTRL", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "K", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		-- }}}

		-- ******* APPLICATION ******* {{{
		{ key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
		{ key = "P", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
		{ key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
		{ key = "x", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
		{ key = "M", mods = "CTRL", action = act.Hide },
		{ key = "M", mods = "SHIFT|CTRL", action = act.Hide },
		{ key = "m", mods = "SHIFT|CTRL", action = act.Hide },
		{ key = "m", mods = "SUPER", action = act.Hide },
		{ key = "H", mods = "CTRL", action = act.HideApplication },
		{ key = "H", mods = "SHIFT|CTRL", action = act.HideApplication },
		{ key = "h", mods = "SHIFT|CTRL", action = act.HideApplication },
		{ key = "h", mods = "SUPER", action = act.HideApplication },
		{ key = "Q", mods = "CTRL", action = act.QuitApplication },
		{ key = "Q", mods = "SHIFT|CTRL", action = act.QuitApplication },
		{ key = "q", mods = "SHIFT|CTRL", action = act.QuitApplication },
		{ key = "q", mods = "SUPER", action = act.QuitApplication },
		{ key = "R", mods = "CTRL", action = act.ReloadConfiguration },
		{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
		{ key = "r", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
		{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
		{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
		{ key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
		{ key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
		-- }}}

		-- ******* CUSTOM ******* {{{
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
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
			{ key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
			{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "End", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "Home", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
			{ key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "F", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "T", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
			{ key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "Space", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
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
			{ key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PriorMatchPage") },
		},
	}
end

return M
