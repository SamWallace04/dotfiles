hl.config({
	general = {
		layout = "master",
		gaps_in = 8,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(cba6f7ff)", "rgba(9399b2ff)" }, angle = 45 },
			inactive_border = { colors = { "rgba(313244cc)", "rgba(585b70cc)" }, angle = 45 },
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
			color = 0xeecba6f7,
			color_inactive = 0xee181825,
			range = 25,
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
