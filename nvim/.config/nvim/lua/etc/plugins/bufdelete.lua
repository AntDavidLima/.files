local M = {
	'famiu/bufdelete.nvim',
}

M.config = function()
	vim.keymap.set('n', 'Q', vim.cmd.Bdelete)
end

return M
