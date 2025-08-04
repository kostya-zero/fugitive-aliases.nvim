local M = {}

-- Registers a new user command.
---@param alias string Alias to a specified command.
---@param command string A command to execute.
---@param desc string Alias ddescription.
function M.register(alias, command, desc)
	vim.api.nvim_create_user_command(alias, function(opts)
		vim.cmd(command .. " " .. opts.args)
	end, {
		nargs = "*",
		desc = desc,
	})
end

-- Sets up aliases to vim-fugitive command.
---@param config FugitiveAliases.Config: Plugin configuration
function M.setup(config)
	if config.ga then
		M.register("Ga", "Git add", "Git add ")
	end

	if config.gaa then
		M.register("Gaa", "Git add .", "Git add all")
	end

	if config.gb then
		M.register("Gb", "Git blame", "Git blame")
	end

	if config.gc then
		M.register("Gc", "Git commit", "Git commit")
	end

	if config.gl then
		M.register("Gl", "Git log", "Git log")
	end

	if config.gs then
		M.register("Gs", "Git status", "Git status")
	end
end

return M
