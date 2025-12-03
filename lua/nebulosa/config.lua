local M = {}

M.defaults = {
	space = 'void',
}

M.options = {}

function M.setup(options)
	M.options = vim.tbl_deep_extend('force', {}, M.defaults, options or {})
	return M.options
end

return M
