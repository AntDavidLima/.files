local M = {
	'windwp/nvim-autopairs',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
}

M.config = function()
	require("nvim-autopairs").setup({
		check_ts = true,
	})
end

return M
