local M = {
	"akinsho/toggleterm.nvim",
}

M.config = function()
	require("toggleterm").setup({
		size = 8,
		open_mapping = [[<C-\>]],
		start_in_insert = true,
		direction = "horizontal",
		close_on_exit = true,
		insert_mappings = true,
		terminal_mappings = true,
	})

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		direction = "float",
	})

	function Toggle_lazygit()
		lazygit:toggle()
	end

	vim.keymap.set("n", "<leader>gl", Toggle_lazygit)

	vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]])
	vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]])
	vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]])

	vim.keymap.set("t", "<C-A-j>", [[<Cmd> resize -2<CR>]])
	vim.keymap.set("t", "<C-A-k>", [[<Cmd> resize +2<CR>]])

	vim.keymap.set("t", "<A-esc>", [[<C-\><C-n>]])
end

return M
