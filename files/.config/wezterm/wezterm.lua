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
  font_size = 14.0,
}

-- make tab titles easier to read by adding padding
wezterm.on("format-tab-title", function(tab)
  local title = " " .. (tab.tab_index + 1) .. ": " .. tab.active_pane.title
  return {
    { Text = wezterm.pad_right(title, 20) },
  }
end)

-- Finally, return the configuration to wezterm:
return config
