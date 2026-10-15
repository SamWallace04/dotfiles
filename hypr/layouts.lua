local M = {}

local VALID_LAYOUTS = {
	master = true,
	dwindle = true,
	scrolling = true,
}

-- Called to change the layout mode at runtime.
function M.set_layout_mode(layout_mode)
	if not VALID_LAYOUTS[layout_mode] then
		return
	end

	hl.config({
		general = {
			layout = layout_mode,
		},
	})
end

-- Default layout on start
hl.config({
	master = {
		orientation = "center",
		mfact = 0.5,
	},
})

return M
