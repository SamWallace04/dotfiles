hl.window_rule({ match = { class = "^()$", title = "^(Picture in picture)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })
hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List)$" }, float = true })
hl.window_rule({ match = { class = "^(steam)$", title = "^(Launching\\.{3})$" }, float = true, center = true })
hl.window_rule({
	match = { class = "^(steam)$", title = "^(Steam)$" },
	float = false,
	workspace = 2,
	no_initial_focus = true,
})

hl.window_rule({ match = { class = "^(obsidian)$" }, opacity = 0.88 })
hl.window_rule({ match = { class = "^(thunar)$" }, opacity = 0.88 })

-- Float Common Modals
local modalMatches = {
	{
		title = "^(Open|Authentication Required|Add Folder to Workspace|Choose Files|Save As|Confirm to replace files|File Operation Progress)$",
	},
	{ initial_title = "^(Open File)$" },
	{ class = "^([Xx]dg-desktop-portal-gtk)$" },
	{ title = "^(File Upload|Choose wallpaper|Library)(.*)$" },
	{ class = "^(.*dialog.*)$" },
	{ title = "^(.*dialog.*)$" },
	{ class = "^(hyprland-share-picker)$" },
}
for _, m in ipairs(modalMatches) do
	hl.window_rule({ match = m, float = true })
end

-- Ignore maximize requests from all apps.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
