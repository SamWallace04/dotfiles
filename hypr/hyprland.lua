require("env")
require("binds")
require("windowrules")
require("style")
require("autolaunch")

hl.monitor({
	output = "5120x1440@240",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})

-- For Noctalia Color templates
require("noctalia").apply_theme()
