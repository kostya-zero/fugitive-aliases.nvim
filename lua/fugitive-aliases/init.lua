local M = {}

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

-- Check if vim-fugitive is loaded.
local function has_cmd()
	return vim.fn.exists(":Git") == 2
end

-- Function to create a user command alias for Git commands.
---@param alias string The alias name for the command.
---@param args string The arguments to pass to the Git command.
---@param desc string A description for the command.
function M.register_alias(alias, args, desc)
	vim.api.nvim_create_user_command(alias, function(opts)
		vim.cmd(args .. " " .. opts.args)
	end, {
		nargs = "*",
		complete = "file",
		desc = desc,
		range = true,
	})
end

-- Sets up alises for vim-fugitive.
---@param opts table|nil User options to override defaults.
function M.setup(opts)
	if not has_cmd() then
		vim.notify("[fugitive-aliases] :Git not found (is tpop/vim-fugitive loaded?)", vim.log.levels.ERROR)
		return
	end

	local config = vim.tbl_deep_extend("force", default_config, opts or {})

	local defs = {
		{ config.gs, "Gs", "Git status", "Git status" },
		{ config.ga, "Ga", "Git add", "Git add" },
		{ config.gaa, "Gaa", "Git add .", "Git add all" },
		{ config.gb, "Gb", "Git blame", "Git blame" },
		{ config.gc, "Gc", "Git commit", "Git commit" },
		{ config.gl, "Gl", "Git log", "Git log" },
		{ config.gp, "Gp", "Git push", "Git push" },
		{ config.gP, "GP", "Git pull", "Git pull" },
		{ config.gd, "Gd", "Git diff", "Git diff" },
		{ config.gr, "Gr", "Git reset", "Git reset" },
		{ config.gR, "GR", "Git rebase", "Git rebase" },
		{ config.gm, "Gm", "Git merge", "Git merge" },
	}

	for _, def in ipairs(defs) do
		local enabled, name, args, desc = unpack(def)
		if enabled then
			M.register_alias(name, args, desc)
		end
	end
end

return M
