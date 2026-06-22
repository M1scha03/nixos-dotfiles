vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "nix", "rust" },
	callback = function(args)
		vim.treesitter.start(args.buf)
		-- vim.wo.foldmethod = "expr"
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
