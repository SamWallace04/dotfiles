hl.on("hyprland.start", function()
	-- Background apps
	hl.exec_cmd("noctalia")
	hl.exec_cmd("linux-wallpaper-engine-ux", { workspace = "3 silent" })
	hl.exec_cmd("fcitx5 -D")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
	hl.exec_cmd("remotemouse")
	hl.exec_cmd("blueman-applet")

	-- Load hyprland apps
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("hyprctl setcursor rose-pine-hyprcursor 24")

	-- Main apps
	hl.exec_cmd("zen-browser", { workspace = "1 silent" })
	hl.exec_cmd("discord", { workspace = "1 silent" })
	hl.exec_cmd("steam", { workspace = "2 silent" })
	hl.exec_cmd("lutris", { workspace = "2 silent" })
end)
