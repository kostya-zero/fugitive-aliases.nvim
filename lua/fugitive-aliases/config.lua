local default_config = {
	gs = true,
	ga = true,
	gaa = true,
	gc = true,
	gl = true,
	gb = true,
	gp = true,
	gd = true,
	gP = true,
	gr = true,
	gR = true,
	gm = true,
}

---@class FugitiveAliases.Config
---@field gs? boolean Enable Git status
---@field ga? boolean Enable Git add
---@field gaa? boolean Enable Git add all
---@field gc? boolean Enable Git commit
---@field gl? boolean Enable Git log
---@field gb? boolean Enable Git blame
---@field gp? boolean Enable Git push
---@field gd? boolean Enable Git diff
---@field gP? boolean Enable Git pull
---@field gr boolean Enable Git reset
---@field gR boolean Enable Git rebase
---@field gm boolean Enable Git merge
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
