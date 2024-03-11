local M = {
	"lewis6991/gitsigns.nvim",
}

M.config = function()
	require("gitsigns").setup({
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 0,
			virt_text_pos = "right_align",
		},
	})

	vim.keymap.set("n", "<leader>gd", [[<Cmd> Gitsigns diffthis<CR>]])
	vim.keymap.set("n", "<leader>gp", [[<Cmd> Gitsigns preview_hunk<CR>]])
	vim.keymap.set("n", "<leader>vgv", [[<Cmd> Gitsigns select_hunk<CR>]])
end

return M
