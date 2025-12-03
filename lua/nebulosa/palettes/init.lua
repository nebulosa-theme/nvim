local M = {}

local palettes = {
	void = 'nebulosa.palettes.void',
	flare = 'nebulosa.palettes.flare',
}

function M.get_palette(space)
	space = space or 'void'

	local path = palettes[space]
	if not path then
		vim.notify(
			string.format('Nebulosa: Unknown variant "%s", falling back to "void"', space),
			vim.log.levels.WARN
		)
		path = palettes.void
	end

	local ok, palette = pcall(require, path)
	if not ok then
		vim.notify(
			string.format('Nebulosa: Failed to load palette "%s"', space),
			vim.log.levels.ERROR
		)
		return require(palettes.void)
	end

	return palette
end

M.setup = M.get_palette

return M
