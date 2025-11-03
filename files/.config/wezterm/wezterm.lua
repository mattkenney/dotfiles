-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- custom config
config.color_scheme = 'Tomorrow (Gogh)'
config.cursor_thickness = 3
config.font = wezterm.font 'Andale Mono'
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true
config.selection_word_boundary = '\t\n !"#%&\'()*+,-./:;<=>?@[\\]^`{|}~'

-- Finally, return the configuration to wezterm:
return config
