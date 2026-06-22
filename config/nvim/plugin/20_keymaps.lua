-- Format LSP
vim.keymap.set("n", "<leader>cf", "<CMD>lua vim.lsp.buf.format()<CR>", { desc = "Call LSP Formatter" })

-- Code Actions
vim.keymap.set("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Exit Terminal Mode
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { silent = true })

-- Switch Focus with Vim Keys
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Buffer Management
vim.keymap.set("n", "H", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "L", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "Q", "<CMD>bdelete<CR>")

-- Barbar
vim.keymap.set("n", "<leader>j", "<CMD>BufferPick<CR>", { desc = "Barber Pick Buffer" })

-- Snacks
vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>,", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>n", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })

vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Open Explorer" })

vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })

vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git Branches" })

vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })

vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })

vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })

vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

vim.keymap.set("n", "<leader>gi", function()
	Snacks.picker.gh_issue()
end, { desc = "GitHub Issues (open)" })

vim.keymap.set("n", "<leader>gI", function()
	Snacks.picker.gh_issue({ state = "all" })
end, { desc = "GitHub Issues (all)" })

vim.keymap.set("n", "<leader>gp", function()
	Snacks.picker.gh_pr()
end, { desc = "GitHub Pull Requests (open)" })

vim.keymap.set("n", "<leader>gP", function()
	Snacks.picker.gh_pr({ state = "all" })
end, { desc = "GitHub Pull Requests (all)" })

vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })

vim.keymap.set("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

vim.keymap.set("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })

vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>fd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>fD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })

vim.keymap.set("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })

vim.keymap.set("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Icons" })

vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })

vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })

vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })

vim.keymap.set("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })

vim.keymap.set("n", "<leader>sp", function()
	Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })

vim.keymap.set("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })

vim.keymap.set("n", "<leader>sR", function()
	Snacks.picker.resume()
end, { desc = "Resume" })

vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })

vim.keymap.set("n", "<leader>sS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })

vim.keymap.set("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })

vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })

vim.keymap.set("n", "grr", function()
	Snacks.picker.lsp_references()
end, { desc = "References", nowait = true })

vim.keymap.set("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })

vim.keymap.set("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })

vim.keymap.set("n", "gai", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "C[a]lls Incoming" })

vim.keymap.set("n", "gao", function()
	Snacks.picker.lsp_outgoing_calls()
end, { desc = "C[a]lls Outgoing" })

vim.keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader>Z", function()
	Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })

vim.keymap.set("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

vim.keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })

vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename File" })

vim.keymap.set({ "n", "v" }, "<leader>gB", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse" })

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

vim.keymap.set("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })

vim.keymap.set({ "n", "t" }, "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })

vim.keymap.set({ "n", "t" }, "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

vim.keymap.set("n", "<C-/>", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })

vim.keymap.set("n", "<C-_>", function()
	Snacks.terminal()
end, { desc = "which_key_ignore" })

-- Debugger
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debug: Start/Continue" })

vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Debug: Step Over" })

vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Debug: Step Into" })

vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Debug: Step Out" })

vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional Breakpoint" })

vim.keymap.set("n", "<leader>dl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debug: Log Point" })

vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, { desc = "Debug: Toggle REPL" })

vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "Debug: Toggle UI" })

vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "Debug: Terminate" })
