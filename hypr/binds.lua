local layouts = require("layouts")

local mainMod = "SUPER"
local shiftMod = mainMod .. "+ SHIFT"
local ctrlMod = mainMod .. "+ CONTROL"
local altMod = mainMod .. "+ ALT"

-- General binds
hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(shiftMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty +new-window"))
hl.bind(shiftMod .. " + C", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload.sh"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-5/launcher.sh"))
--hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))

-- Layout binds
hl.bind(mainMod .. " + M", function()
	layouts.set_layout_mode("master")

	hl.bind(shiftMod .. " + RETURN", hl.dsp.layout("swapwithmaster"))
end)
hl.bind(shiftMod .. " + M", function()
	layouts.set_layout_mode("scrolling")

	hl.bind(mainMod .. " + PERIOD", hl.dsp.layout("swapcol r"))
	hl.bind(mainMod .. " + COMMA", hl.dsp.layout("swapcol l"))
	hl.bind(mainMod .. " + H", hl.dsp.layout("move -col"))
	hl.bind(mainMod .. " + L", hl.dsp.layout("move +col"))
	hl.bind(mainMod .. " + mouse_down", hl.dsp.layout("move -col"))
	hl.bind(mainMod .. " + mouse_up", hl.dsp.layout("move +col"))
end)
hl.bind(ctrlMod .. " + M", function()
	layouts.set_layout_mode("dwindle")
end)

hl.bind(shiftMod .. " + RETURN", hl.dsp.layout("swapwithmaster"))

-- Window binds
hl.bind(shiftMod .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(shiftMod .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(shiftMod .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(shiftMod .. " + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(shiftMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(shiftMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspace binds

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(shiftMod .. " + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(shiftMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(shiftMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Screen capture
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(shiftMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- TODO: Update binds to use functions
local function bind_move(mod, keys, command)
	hl.bind(mod .. " + " .. keys, hl.dsp.exec_cmd(command))
end

return {
	mainMod,
	shiftMod,
	ctrlMod,
	altMod,
}
