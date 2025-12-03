local M = {}

function M.load(config)
	local palettes = require('nebulosa.palettes')
	local colors = palettes.get_palette(config.space)
end
