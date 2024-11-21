local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "nightfox"
config.wsl_domains = {
    {
        name = "WSL:Arch",
        distribution = "Arch",
    },
}
config.default_domain = "WSL:Arch"
config.window_background_opacity = 0.90
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
