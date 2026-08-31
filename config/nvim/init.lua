local herdr_dirs = {
	h = "left",
	j = "down",
	k = "up",
	l = "right",
}

local function navigate(key)
	local current = vim.api.nvim_get_current_win()

	vim.cmd("wincmd " .. key)

	-- Vim moved to another split, so we're done.
	if vim.api.nvim_get_current_win() ~= current then
		return
	end

	-- No Neovim split exists in that direction.
	-- Ask Herdr to cross the pane boundary.
	local pane = vim.env.HERDR_PANE_ID
	if not pane then
		return
	end

	vim.system({
		"herdr",
		"pane",
		"focus",
		"--pane",
		pane,
		"--direction",
		herdr_dirs[key],
	}, { detach = true })
end

for _, key in ipairs({ "h", "j", "k", "l" }) do
	vim.keymap.set("n", "<C-" .. key .. ">", function()
		navigate(key)
	end, { silent = true })
end

for _, key in ipairs({ "h", "j", "k", "l" }) do
	vim.keymap.set("t", "<C-" .. key .. ">", function()
		vim.cmd("stopinsert")
		navigate(key)
	end, { silent = true })
end
