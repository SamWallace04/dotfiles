local host = require("host")

require("env")
require("binds")
require("windowrules")
require("style")
require("autolaunch")

-- For Noctalia Color templates
require("noctalia").apply_theme()

-- Machine-specific overrides live in hosts/<hostname>.lua (loaded last so they win).
-- No host file = this desktop's monitor setup.
if not host.load() then
	hl.monitor({
		output = "5120x1440@240",
		mode = "preferred",
		position = "0x0",
		scale = 1,
	})
end
