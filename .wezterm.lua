-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

default_gui_startup_args = {'start', '--always-new-process'}
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

config.font_size = 14
config.font = wezterm.font('Fira Code')

config.keys = {
  -- Tab Navigation
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(-1),
  },

  -- Split command
  {
    key = 'd',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = 'd',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitVertical,
  },

  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'End'}
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'Home'}
  },
  {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'PageUp'}
  },
  {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'PageDown'}
  },

  -- Ignore default assignment
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment
  },
}

-- and finally, return the configuration to wezterm
return config
