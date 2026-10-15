-- Per-machine overrides. Loads hypr/hosts/<hostname>.lua if it exists, so one
-- dotfiles repo can serve the Arch desktop and the NixOS VM.
local M = {}

local function read_hostname()
	local f = io.open("/etc/hostname", "r")
	if not f then
		return ""
	end
	local name = f:read("*l") or ""
	f:close()
	return (name:gsub("^%s+", ""):gsub("%s+$", ""))
end

M.name = read_hostname()

-- Returns true if a host file was found and applied.
function M.load()
	local config_home = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
	local path = config_home .. "/hypr/hosts/" .. M.name .. ".lua"
	local f = io.open(path, "r")
	if not f then
		return false
	end
	f:close()
	dofile(path)
	return true
end

return M
