local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
}

M.config = function()
	require("mason").setup()

	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"tailwindcss",
			"tsserver",
			"html",
			"prismals",
			"gopls",
			"docker_compose_language_service",
			"eslint",
			"bashls",
		},
	})
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			---@diagnostic disable-next-line: undefined-field
			require("lspconfig")[server_name].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	})

	vim.keymap.set("n", "<Space>m", ":Mason<CR>")
end

return M
