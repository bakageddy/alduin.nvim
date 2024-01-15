local p = require("alduin").palette

local alduin = {}

alduin.normal = {
	a = { bg = p.blue, fg = p.black },
	b = { bg = p.black_soft, fg = p.blue },
	c = { bg = p.bg, fg = p.fg },
}

alduin.insert = {
	a = { bg = p.green, fg = p.black },
	b = { bg = p.black_soft, fg = p.green },
}

alduin.command = {
	a = { bg = p.yellow, fg = p.black },
	b = { bg = p.black_soft, fg = p.yellow },
}

alduin.visual = {
	a = { bg = p.red, fg = p.black },
	b = { bg = p.black_soft, fg = p.red },
}

alduin.replace = {
	a = { bg = p.magneta, fg = p.black },
	b = { bg = p.black_soft, fg = p.magneta },
}

alduin.terminal = {
	a = { bg = p.cyan, fg = p.black },
	b = { bg = p.black_soft, fg = p.cyan },
}

alduin.inactive = {
	a = { bg = p.black_soft, fg = p.cyan },
	b = { bg = p.black_soft, fg = p.fg },
	c = { bg = p.black_soft, fg = p.fg },
}

return alduin
