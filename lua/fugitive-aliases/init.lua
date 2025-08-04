local M = {}

-- Sets up alises for vim-fugitive.
---@param opts table|nil User options to override defaults.
function M.setup(opts)
	if M.check_for_fugitive() == false then
		vim.notify("Cannot load plugin because vim-fugitive is not being loaded.", vim.log.levels.ERROR, {
			title = "Fugitive Aliases Error",
		})
		return
	end

	require("fugitive-aliases.config").setup(opts)
	local config = require("fugitive-aliases.config").get()
	require("fugitive-aliases.commands").setup(config)
end

-- Checks if vim-fugitive plugin is loaded
function M.check_for_fugitive()
	local exists = vim.fn.exists(":Git")
	if exists == 2 then
		return true
	else
		return false
	end
end

return M
