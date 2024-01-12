---@class Alduin
local Alduin = {}

Alduin.config = {
	terminal_colors = true,
	italic = {
		strings = true,
		comments = true,
	},
	bold = true,
	invert_selection = true,
	underline = true,
}

Alduin.palette = {
	bg = "#1c1c1c",
	fg = "#dfdfaf",
	cursor = "#dfaf87",

	black = "#1c1c1c",
	black_soft = "#262626",

	red = "#8b5f61",
	green = "#87875f",
	yellow = "#fed975",
	blue = "#87afaf",
	cyan = "#878787",
	magneta = "#af8787",
	orange = "#d69f74",
	white = "#f4f4f4",
}

local function get_theme()
	local p = Alduin.palette
	local conf = Alduin.config

	-- TODO: palette_overrides
	return p
end

local function get_groups()
	local conf = Alduin.config
	local theme = get_theme()
	if conf.terminal_colors then
		local term_cols = {
			theme.bg,
			theme.red,
			theme.green,
			theme.yellow,
			theme.blue,
			theme.magneta,
			theme.cyan,
			theme.white,
			theme.black_soft,
			theme.red,
			theme.green,
			theme.yellow,
			theme.blue,
			theme.magneta,
			theme.cyan,
			theme.white,
		}

		for i, val in ipairs(term_cols) do
			vim.g["terminal_color_" .. i - 1] = val
		end
	end

	local groups = {
		-- Theme Colors
		AlduinRed                   = { fg = theme.red, bg = theme.bg },
		AlduinBlue                  = { fg = theme.blue, bg = theme.bg },
		AlduinGreen                 = { fg = theme.green, bg = theme.bg },
		AlduinCyan                  = { fg = theme.cyan, bg = theme.bg },
		AlduinSoft                  = { fg = theme.black_soft, bg = theme.bg },
		AlduinYellow                = { fg = theme.yellow, bg = theme.bg },
		AlduinMagenta               = { fg = theme.magneta, bg = theme.bg },
		AlduinOrange                = { fg = theme.orange, bg = theme.bg },

		Normal                      = { fg = theme.fg, bg = theme.bg },
		NormalFloat                 = { fg = theme.fg, bg = theme.black_soft },
		NormalNC                    = { link = "Normal" },
		CursorLine                  = { bg = theme.black_soft },
		CursorColumn                = { link = "CursorLine" },
		TabLineFill                 = { bg = theme.bg },
		TablineSel                  = { bg = theme.bg },
		TabLine                     = { link = "TabLineFill" },
		MatchParen                  = { fg = theme.cyan },
		ColorColumn                 = { link = "CursorLine" },
		Conceal                     = { fg = theme.blue },
		CursorLineNr                = { fg = theme.orange, bg = theme.bg },
		NonText                     = { fg = theme.black_soft },
		SpecialKey                  = { fg = theme.black_soft },
		Visual                      = { fg = "#1d2021", bg = theme.cyan, reverse = conf.invert_selection },
		VisualNOS                   = { link = "Visual" },
		Search                      = { fg = theme.bg, bg = theme.orange },
		IncSearch                   = { fg = theme.bg, bg = theme.yellow },
		CurSearch                   = { link = "IncSearch" },
		QuickFixLine                = { fg = theme.magneta },
		UnderLined                  = { fg = theme.cyan, underline = conf.underline },
		StatusLine                  = { fg = theme.fg, bg = theme.bg },
		StatusLineNC                = { fg = theme.fg, bg = theme.black_soft },
		WinBar                      = { fg = theme.cyan, bg = theme.bg },
		WinBarNC                    = { fg = theme.fg, bg = theme.black_soft },
		WinSeparator                = { fg = theme.black_soft },
		WildMenu                    = { fg = theme.black, bg = theme.red },
		Directory                   = { fg = theme.green },
		Title                       = { fg = theme.green },
		ErrorMsg                    = { fg = theme.red },
		MoreMsg                     = { fg = theme.yellow },
		ModeMsg                     = { link = "ModeMsg" },
		Question                    = { fg = theme.orange },
		WarningMsg                  = { fg = theme.magneta },
		LineNr                      = { fg = theme.fg },
		SignColumn                  = { bg = theme.bg },
		Folded                      = { fg = theme.green, bg = theme.bg },
		FoldColumn                  = { link = "Folded" },
		Cursor                      = { reverse = false },
		vCursor                     = { reverse = true },
		iCursor                     = { link = "Cursor" },
		lCursor                     = { link = "Cursor" },

		-- Syntax
		Delimiter                   = { link = "AlduinMagenta" },
		Special                     = { link = "AlduinMagenta" },
		Comment                     = { fg = theme.green, bg = theme.bg, italic = conf.italic.comments },
		Error                       = { bg = theme.magneta, fg = theme.black },
		Statement                   = { link = "AlduinCyan" },
		Conditional                 = { link = "AlduinCyan" },
		Repeat                      = { link = "AlduinCyan" },
		Label                       = { link = "AlduinCyan" },
		Exception                   = { link = "AlduinCyan" },
		Operator                    = { link = "AlduinCyan" },
		Keyword                     = { link = "AlduinCyan" },
		Identifier                  = { link = "AlduinBlue" },
		Function                    = { link = "AlduinRed" },
		PreProc                     = { link = "AlduinOrange" },
		Include                     = { link = "AlduinOrange" },
		Define                      = { link = "AlduinOrange" },
		Macro                       = { link = "AlduinOrange" },
		PreCondit                   = { link = "AlduinOrange" },
		Constant                    = { link = "AlduinMagenta" },
		Character                   = { link = "AlduinOrange" },
		String                      = { fg = theme.yellow, italic = conf.italic.strings },
		Boolean                     = { link = "AlduinOrange" },
		Number                      = { link = "AlduinOrange" },
		Float                       = { link = "AlduinOrange" },
		Type                        = { link = "AlduinOrange" },
		StorageClass                = { link = "AlduinRed" },
		Structure                   = { link = "AlduinRed" },
		Typedef                     = { link = "AlduinRed" },

		-- GitSigns
		GitSignsAdd                 = { link = "AlduinGreen" },
		GitSignsChange              = { link = "AlduinBlue" },
		GitSignsDelete              = { link = "AlduinMagenta" },

		-- Telescope
		TelescopeNormal             = { fg = theme.fg, bg = theme.bg },
		TelescopeSelection          = { link = "AlduinCyan" },
		TelescopeSelectionCaret     = { link = "AlduinMagenta" },
		TelescopeMultiSelection     = { link = "AlduinCyan" },
		TelescopeBorder             = { link = "TelescopeNormal" },
		TelescopePromptBorder       = { link = "TelescopeNormal" },
		TelescopeResultsBorder      = { link = "TelescopeNormal" },
		TelescopePreviewBorder      = { link = "TelescopeNormal" },
		TelescopeMatching           = { link = "IncSearch" },
		TelescopePromptPrefix       = { link = "AlduinRed" },
		TelescopePrompt             = { link = "TelescopeNormal" },

		-- Treesitter?
		["@comment"]                = { link = "Comment" },
		["@none"]                   = { bg = "NONE", fg = "NONE" },
		["@preproc"]                = { link = "PreProc" },
		["@define"]                 = { link = "Define" },
		["@operator"]               = { link = "Operator" },
		["@punctuation.delimiter"]  = { link = "Delimiter" },
		["@punctuation.bracket"]    = { link = "Delimiter" },
		["@punctuation.special"]    = { link = "Delimiter" },
		["@string"]                 = { link = "String" },
		["@string.regex"]           = { link = "String" },
		["@string.escape"]          = { link = "SpecialChar" },
		["@string.special"]         = { link = "SpecialChar" },
		["@character"]              = { link = "Character" },
		["@character.special"]      = { link = "SpecialChar" },
		["@boolean"]                = { link = "Boolean" },
		["@number"]                 = { link = "Number" },
		["@float"]                  = { link = "Float" },
		["@function"]               = { link = "Function" },
		["@function.builtin"]       = { link = "Special" },
		["@function.call"]          = { link = "Function" },
		["@function.macro"]         = { link = "Macro" },
		["@method"]                 = { link = "Function" },
		["@method.call"]            = { link = "Function" },
		["@constructor"]            = { link = "Special" },
		["@parameter"]              = { link = "Identifier" },
		["@keyword"]                = { link = "Keyword" },
		["@keyword.function"]       = { link = "Keyword" },
		["@keyword.operator"]       = { link = "Operator" },
		["@keyword.return"]         = { link = "Keyword" },
		["@conditional"]            = { link = "Conditional" },
		["@repeat"]                 = { link = "Repeat" },
		["@debug"]                  = { link = "Debug" },
		["@label"]                  = { link = "Label" },
		["@include"]                = { link = "Include" },
		["@exception"]              = { link = "Exception" },
		["@type"]                   = { link = "Type" },
		["@type.builtin"]           = { link = "Type" },
		["@type.definition"]        = { link = "Typedef" },
		["@type.qualifier"]         = { link = "Type" },
		["@storageclass"]           = { link = "StorageClass" },
		["@attribute"]              = { link = "PreProc" },
		["@field"]                  = { link = "Identifier" },
		["@property"]               = { link = "Identifier" },
		["@variable"]               = { fg = theme.fg, bg = theme.bg },
		["@variable.builtin"]       = { link = "Special" },
		["@constant"]               = { link = "Constant" },
		["@constant.builtin"]       = { link = "Special" },
		["@constant.macro"]         = { link = "Define" },
		["@namespace"]              = { link = "AlduinBlue" },
		["@symbol"]                 = { link = "Identifier" },
		["@text"]                   = { fg = theme.fg, bg = theme.bg },
		["@text.title"]             = { link = "Title" },
		["@text.literal"]           = { link = "String" },
		["@text.uri"]               = { link = "Underlined" },
		["@text.math"]              = { link = "Special" },
		["@text.environment"]       = { link = "Macro" },
		["@text.environment.name"]  = { link = "Type" },
		["@text.reference"]         = { link = "Constant" },
		["@text.note"]              = { link = "SpecialComment" },
		["@text.warning"]           = { link = "WarningMsg" },
		["@text.danger"]            = { link = "ErrorMsg" },
		["@text.diff.add"]          = { link = "GitSignsAdd" },
		["@text.diff.delete"]       = { link = "GitSignsDelete" },
		["@tag"]                    = { link = "Tag" },
		["@tag.attribute"]          = { link = "Identifier" },
		["@tag.delimiter"]          = { link = "Delimiter" },
		["@punctuation"]            = { link = "Delimiter" },
		["@macro"]                  = { link = "Macro" },
		["@structure"]              = { link = "Structure" },
		["@lsp.type.class"]         = { link = "@type" },
		["@lsp.type.comment"]       = { link = "@comment" },
		["@lsp.type.decorator"]     = { link = "@macro" },
		["@lsp.type.enum"]          = { link = "@type" },
		["@lsp.type.enumMember"]    = { link = "@constant" },
		["@lsp.type.function"]      = { link = "@function" },
		["@lsp.type.interface"]     = { link = "@constructor" },
		["@lsp.type.macro"]         = { link = "@macro" },
		["@lsp.type.method"]        = { link = "@method" },
		["@lsp.type.namespace"]     = { link = "@namespace" },
		["@lsp.type.parameter"]     = { link = "@parameter" },
		["@lsp.type.property"]      = { link = "@property" },
		["@lsp.type.struct"]        = { link = "@type" },
		["@lsp.type.type"]          = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type.definition" },
		["@lsp.type.variable"]      = { link = "@variable" },
	}

	return groups
end

Alduin.setup = function(config)
	Alduin.config = vim.tbl_deep_extend("force", Alduin.config, config or {})
end

Alduin.load = function()
	if vim.version().minor < 8 then
		vim.notify_once("alduin.nvim: you must use neovim 0.8 or higher")
		return
	end
	if vim.g.colors_name then
		vim.cmd.hi [[clear]]
	end

	vim.g.colors_name = "alduin"
	vim.o.termguicolors = true

	local grps = get_groups()

	for grp, settings in pairs(grps) do
		vim.api.nvim_set_hl(0, grp, settings)
	end
end

return Alduin
