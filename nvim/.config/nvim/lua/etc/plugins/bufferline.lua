local M = {
	"akinsho/bufferline.nvim",
	version = "v4.*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	local bufferline = require("bufferline")
	bufferline.setup({
		---@diagnostic disable-next-line: missing-fields
		options = {
			separator_style = "thin", -- "slant" | "slope" | "thick" | "thin"
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and "  "
							or (e == "warning" and "  " or e == "hint" and "  " or "  ")
					s = s .. n .. sym
				end
				return s
			end,
			offsets = {
				{
					filetype = "NvimTree",
				},
			},
		},
	})

	vim.keymap.set("n", "H", vim.cmd.BufferLineCyclePrev)
	vim.keymap.set("n", "L", vim.cmd.BufferLineCycleNext)
	vim.keymap.set("n", "<A-h>", vim.cmd.BufferLineMovePrev)
	vim.keymap.set("n", "<A-l>", vim.cmd.BufferLineMoveNext)
end

return M
