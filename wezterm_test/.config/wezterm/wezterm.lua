local wezterm = require 'wezterm';
return {
  font = wezterm.font("UbuntuMono Nerd Font Mono",  {weight="Regular", italic=false}),
  font_size = 19.0,
  color_scheme_dirs = {"./colors/"},
  color_scheme = "solarized-patched",
  --[[ send_composed_key_when_left_alt_is_pressed=false,
  send_composed_key_when_right_alt_is_pressed=true, ]]
  keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {key="|", mods="SUPER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="-", mods="SUPER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  }
}
