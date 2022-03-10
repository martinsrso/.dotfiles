local wezterm = require 'wezterm';

return {
  disable_default_mouse_bindings = true,
    exit_behavior = "Close",
      scrollback_lines = 3500,
      skip_close_confirmation_for_processes_named = {
    "bash", "sh", "zsh", "fish", "tmux"
  },
  font = wezterm.font("Hasklug Nerd Font"),
    font_size = 15,
  color_scheme_dirs = {"$HOME/.config/wezterm/colors"},
  color_scheme = "solarized_light",
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_max_width = 40,
    window_padding = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2,
  },
  colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = "#eee8d5",

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = "#268bd2",
        -- The color of the text for the tab
        fg_color = "#fdf6e3",

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = "Normal",

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = "None",

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = "#839496",
        fg_color = "#fdf6e3",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = "#839496",
        fg_color = "#fdf6e3",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      },

      -- The new tab button that let you create new tabs
      new_tab = {
        bg_color = "#d33682",
        fg_color = "#fdf6e3",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
        bg_color = "#d33682",
        fg_color = "#fdf6e3",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab_hover`.
      }
    },
            -- foreground = "#2a1a4a",
    -- background = "#2a1a4a",
    ansi = {
      "#0a0520",
      "#ff796d",
      "#99b481",
      "#efdfac",
      "#66d9ef",
      "#e78fcd",
      "#ba8cff",
      "#000000"
    },
    -- brights = {
    --   "#100b23",
    --   "#f99f92",
    --   "#b4be8f",
    --   "#f2e9bf",
    --   "#79daed",
    --   "#ba91d4",
    --   "#a0a0d6",
    --   "#b9aed3"
    -- }
  },
      -- leader = { key=" ", mods="CTRL", timeout_milliseconds=1000 },
    keys = {
        {key="t", mods="SUPER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="n", mods="SUPER", action=wezterm.action{SpawnTab="DefaultDomain"}},
        {key="l", mods="SUPER", action="ActivateLastTab"},
        {key="-", mods="SUPER", action="ActivateCopyMode"},

        {key="'", mods="SUPER",
         action=wezterm.action{QuickSelectArgs={
           patterns={
              "(?:\')(.*)(?:\')"
           },
         }}},
        {key="\"", mods="SUPER",
         action=wezterm.action{QuickSelectArgs={
           patterns={
              "(?:\")(.*)(?:\")"
           },
         }}},
        {key="u", mods="SUPER",
             action=wezterm.action{QuickSelectArgs={
               patterns={
                  "https?://\\S+"
               },
            action = wezterm.action_callback(function(window, pane)
                  local url = window:get_selection_text_for_pane(pane)
                  wezterm.log_info("opening: " .. url)
                  wezterm.open_with(url)
               end),
                alphabet="dvorak"
             }}
       },

    },
}
