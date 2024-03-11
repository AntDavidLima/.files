local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
}

M.name = "gruvbox"

function M.config()
	require(M.name).setup({
		transparent_mode = true,
	})

	vim.cmd.colorscheme(M.name)
end

return M
