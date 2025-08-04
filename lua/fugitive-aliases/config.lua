local default_config = {
	gs = true,
	ga = true,
	gaa = true,
	gc = true,
	gl = true,
	gb = true,
}

---@class FugitiveAliases.Config
---@field gs? boolean Enable Git status
---@field ga? boolean Enable Git add
---@field gaa? boolean Enable Git add all
---@field gc? boolean Enable Git commit
---@field gl? boolean Enable Git log
---@field gb? boolean Enable Git blame
local config = vim.deepcopy(default_config)

local M = {}

-- Sets up the plugin configuration.
---@param opts table|nil User options to override defaults.
function M.setup(opts)
	opts = opts or {}
	config = vim.tbl_deep_extend("force", default_config, opts)
end

-- Returns the current plugin configuration.
function M.get()
	return config
end

return M
