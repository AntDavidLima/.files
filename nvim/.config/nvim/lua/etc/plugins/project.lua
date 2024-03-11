local M = {
	'ahmedkhalf/project.nvim',
}

M.config = function()
	require('project_nvim').setup({
		patterns = { '.git' },
		detection_methods = { 'pattern' },
	})
end

return M
