local M = {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'ahmedkhalf/project.nvim',
	},
}

M.config = function()
	require('telescope').load_extension('projects')

	vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
	vim.keymap.set("n", "<leader>fi", ":Telescope current_buffer_fuzzy_find<CR>")
	vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>")
	vim.keymap.set("n", "<leader>ff", ":Telescope fd<CR>")
	vim.keymap.set("n", "<leader>fg", ":Telescope git_files<CR>")
	vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>")
	vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>")
	vim.keymap.set("n", "<leader>fq", ":Telescope planets<CR>")
	vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>")
	vim.keymap.set("n", "<leader>fs", ":Telescope spell_suggest<CR>")
end

return M
