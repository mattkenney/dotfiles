-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local is_mac = wezterm.target_triple:find 'darwin' ~= nil

-- custom config
config.color_scheme = 'Tomorrow (Gogh)'
config.cursor_thickness = 3
config.font = wezterm.font 'Andale Mono'
config.font_size = is_mac and 14.0 or 11.0
config.hide_tab_bar_if_only_one_tab = true
config.selection_word_boundary = '\t\n !"#%&\'()*+,-./:;<=>?@[\\]^`{|}~'

-- use wezterm's terminfo if it's installed locally
local function has_terminfo(name)
  local ok = wezterm.run_child_process { 'infocmp', name }
  return ok
end

if has_terminfo('wezterm') then
  config.term = 'wezterm'
end

-- custom key bindings
config.keys = {
  {
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    key = 'k',
    mods = 'CMD',
  },
}

config.window_frame = {
  font = wezterm.font("Andale Mono", { weight = "Bold" }),
  font_size = is_mac and 14.0 or 11.0,
}

-- macos already draws its own window border
if not is_mac then
  local border_color = '#484848'
  local border_size = '1px'

  config.window_frame.border_bottom_color = border_color
  config.window_frame.border_bottom_height = border_size
  config.window_frame.border_left_color = border_color
  config.window_frame.border_left_width = border_size
  config.window_frame.border_right_color = border_color
  config.window_frame.border_right_width = border_size
end

-- make tab titles easier to read by adding padding
wezterm.on("format-tab-title", function(tab)
  local title = " " .. (tab.tab_index + 1) .. ": " .. tab.active_pane.title
  return {
    { Text = wezterm.pad_right(title, 20) },
  }
end)

-- Finally, return the configuration to wezterm:
return config
