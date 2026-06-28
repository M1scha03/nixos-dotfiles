vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/navarasu/onedark.nvim",
	"https://github.com/xiyaowong/transparent.nvim",
})

require("tokyonight").setup({
	transparent = true,
	styles = {
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
	on_highlights = function(hl, c)
		hl.StatusLine = { fg = c.fg_sidebar, bg = "none" }
		hl.StatusLineNC = { fg = c.fg_gutter, bg = "none" }
	end,
})

require("catppuccin").setup({
	transparent_background = true,
	float = {
		transparent = true,
		solid = true,
	},
})

require("vague").setup({
	transparent = true,
})

require("onedark").setup({
	transparent = true,
})

require("rose-pine").setup({
	styles = {
		bold = true,
		italic = false,
		transparency = true,
	},
})

vim.cmd.colorscheme("catppuccin")

local auto_theme_custom = require("lualine.themes.nord")

for _, mode in pairs(auto_theme_custom) do
	for section_name, section in pairs(mode) do
		if section_name ~= "a" then
			section.bg = "none"
		end
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = auto_theme_custom,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "|", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "lsp_status", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

require("transparent").setup({
	-- table: default groups
	groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
	},
	-- table: additional groups that should be cleared
	extra_groups = { "RenderMarkdownH1Bg, RenderMarkdownH2Bg", "RenderMarkdownH1", "RenderMarkdownH2" },
	-- table: groups you don't want to clear
	exclude_groups = {},
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
})

vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { bg = "NONE" })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { bg = "NONE" })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { bg = "NONE" })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { bg = "NONE" })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { bg = "NONE" })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { bg = "NONE" })
