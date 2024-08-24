local M = {}
function M.apply_to_config(config)
	config.background = {
		{
			source = { File = "/Users/hal/Documents/terminal_images/birth_stars.png" },
			hsb = { brightness = 0.1 },
		},
	}
end

return M
