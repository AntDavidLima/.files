local M = {
	"zbirenbaum/copilot.lua",
}

M.config = function()
	require("copilot").setup({
		panel = {
			auto_refresh = true,
			keymap = {
				jump_prev = "<C-k>",
				jump_next = "<C-j>",
			},
		},
		suggestion = {
			auto_trigger = true,
			accept = "<A-Tab>",
			accept_word = "<A-w>",
			accept_line = "<A-l>",
			next = "<A-j>",
			prev = "<A-k>",
			dismiss = "<A-h>",
		},
		filetypes = {
			["*"] = true,
		},
	})

	local suggestion = require("copilot.suggestion")

	vim.keymap.set('i', '<A-Tab>', suggestion.accept)
	vim.keymap.set('i', '<A-w>', suggestion.accept_word)
	vim.keymap.set('i', '<A-l>', suggestion.accept_line)
	vim.keymap.set('i', '<A-j>', suggestion.next)
	vim.keymap.set('i', '<A-k>', suggestion.prev)
	vim.keymap.set('i', '<A-h>', suggestion.dismiss)
end

return M
