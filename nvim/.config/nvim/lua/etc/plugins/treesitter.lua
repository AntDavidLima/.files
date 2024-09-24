local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

M.config = function()
	---@diagnostic disable-next-line: missing-fields
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"css",
			"html",
			"javascript",
			"typescript",
			"tsx",
			"lua",
			"yuck",
		},
		highlight = {
			enable = true,
		},
	})
end

return M
