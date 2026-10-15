hl.config({
	general = {
		layout = "master",
		gaps_in = 8,
		gaps_out = 10,
		border_size = 2,
	},
	input = {
		sensitivity = 0,
	},
	decoration = {
		rounding = 20,
		rounding_power = 2,
		shadow = {
			enabled = true,
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
