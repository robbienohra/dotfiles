local wezterm = require("wezterm")
local scheme = wezterm.get_builtin_color_schemes()["Gruvbox Dark"]
scheme.background = "#282828"
return {
  color_schemes = {
    ["Gruvbox Dark"] = scheme,
  },
  color_scheme = "Gruvbox Dark",
  -- font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" }),
  font = wezterm.font("JetBrains Mono", { bold = true }),
  keys = {
    { key = "w", mods = "CMD", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
    { key = "9", mods = "ALT", action = wezterm.action({ ShowLauncherArgs = { flags = "FUZZY|TABS" } }) },
    -- { key = "9", mods = "ALT", action = "ShowTabNavigator" },
  },
  window_decorations = "RESIZE",
  font_size = 13.5,
  window_background_opacity = 1.0,
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  window_close_confirmation = "NeverPrompt",
}
