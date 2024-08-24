local wezterm = require("wezterm")
-- Ensure that Wezterm is in your path
-- PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
-- export PATH

-- load functions
require("functions")

-- Config extensions
local config = {}
local settings = require("settings")
local background = require("background")
local key_bindings = require("key_bindings")

settings.apply_to_config(config)
background.apply_to_config(config)
key_bindings.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
