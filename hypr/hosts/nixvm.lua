-- NixOS VM on TrueNAS: no GPU, so Hyprland renders in software (llvmpipe).
-- Runs after the shared config, so these values win.

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
	decoration = {
		blur = { enabled = false },
		shadow = { enabled = false },
	},
	animations = {
		enabled = false,
	},
})
