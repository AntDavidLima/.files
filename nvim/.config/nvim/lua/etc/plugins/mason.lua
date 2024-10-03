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
			"ts_ls",
			"html",
			"prismals",
			"gopls",
			"docker_compose_language_service",
			"eslint",
			"bashls",
			"basedpyright",
			"biome",
			"ruff"
		},
	})

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			---@diagnostic disable-next-line: undefined-field
			require("lspconfig")[server_name].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,

		["basedpyright"] = function()
			local function which_python()
				local f = io.popen('env which python', 'r') or error("Fail to execute 'env which python'")
				local s = f:read('*a') or error("Fail to read from io.popen result")
				f:close()
				return string.gsub(s, '%s+$', '')
			end

			require("lspconfig").basedpyright.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					python = {
						pythonPath = which_python(),
					}
				}
			})
		end
	})

	vim.keymap.set("n", "<Space>m", ":Mason<CR>")
end

return M
