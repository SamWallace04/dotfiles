local primary = "rgb(f2c1d4)"
local surface = "rgb(2a1922)"
local secondary = "rgb(ffd6e2)"
local error = "rgb(ec8a92)"
local tertiary = "rgb(d4a3bd)"
local surface_lowest = "rgb(311f29)"

hl.config({
	general = {
		layout = "master",
		gaps_in = 8,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = { colors = { primary }, angle = 45 },
			inactive_border = { colors = { surface }, angle = 45 },
		},
	},
	input = {
		sensitivity = 0,
	},
	decoration = {
		rounding = 20,
		rounding_power = 2,
		shadow = {
			enabled = true,
			color = tertiary,
			color_inactive = surface_lowest,
			range = 15,
		},
		blur = {
			enabled = true,
			size = 6,
			passes = 2,
		},
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
	},
})
