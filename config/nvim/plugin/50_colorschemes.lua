vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/rebelot/kanagawa.nvim",
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

require("kanagawa").setup({
	transparent = true,
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

vim.cmd.colorscheme("catppuccin-mocha")

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
