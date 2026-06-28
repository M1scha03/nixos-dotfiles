vim.pack.add({
	-- Dependencies, do not need setup()
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/rafamadriz/friendly-snippets",

	-- Plugins
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/sudo-tee/opencode.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})
require("opencode").setup()
require("which-key").setup({
	preset = "helix",
})
require("nvim-autopairs").setup()
require("mini.surround").setup()
require("notify").setup()
require("render-markdown").setup({
	heading = {
		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},
		foregrounds = {
			"RenderMarkdownH1",
			"RenderMarkdownH2",
			"RenderMarkdownH3",
			"RenderMarkdownH4",
			"RenderMarkdownH5",
			"RenderMarkdownH6",
		},
	},
})
