local wezterm = require("wezterm")
local M = {}

function M.apply_to_config(config)
	config.font = wezterm.font("MesloLGMDZ Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
	config.font_size = 18
	config.pane_focus_follows_mouse = true
	config.scrollback_lines = 5000
	config.tab_bar_at_bottom = true
	config.window_padding = { left = 20, right = 20, top = 30, bottom = 20 }
end

return M
