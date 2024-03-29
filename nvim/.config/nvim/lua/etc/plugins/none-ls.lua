local M = {
	"nvimtools/none-ls.nvim",
}

M.config = function()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local code_actions = null_ls.builtins.code_actions

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.prettier,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		end,
	})

	vim.keymap.set("n", "<leader>lF", ":NullLsInfo<CR>")
end

return M
