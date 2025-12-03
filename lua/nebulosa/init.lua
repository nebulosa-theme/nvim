local M = {}

M._config = nil

function M.setup(options)
	local config = require('nebulosa.config')
	M._config = config.setup(options)
end

function M.load(space)
	if vim.g.colors_name then
		vim.cmd('hi clear')
	end

	vim.o.termguicolors = true

	vim.g.colors_name = space or 'void'

	if not M._config then
		M.setup({})
	end

	if space then
		M._config.space = space
	end

	local theme = require('nebulosa.theme')
	theme.load(M._config)
end

function M.load_void()
	M.load('void')
end

function M.load_flare()
	M.load('flare')
end

return M
