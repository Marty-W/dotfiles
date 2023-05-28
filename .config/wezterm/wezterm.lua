local wezterm = require("wezterm")

local config = {
	line_height = 1.2,
	force_reverse_video_cursor = true,
	font = wezterm.font("liga sfmono nerd font"),
	window_background_opacity = 0.70,
	macos_window_background_blur = 80,
	use_fancy_tab_bar = false,
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	adjust_window_size_when_changing_font_size = false,
	font_size = 18.0,
	window_padding = { bottom = 0, left = 10, right = 10, top = 10 },
	show_update_window = false,
	window_close_confirmation = "NeverPrompt",
	enable_scroll_bar = false,
	disable_default_key_bindings = true,
	scrollback_lines = 5000,
	color_scheme = "kanagawa",
	use_dead_keys = true,
	keys = {
		{ key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
	},
}

return config
