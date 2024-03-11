local M = {
	"mxsdev/nvim-dap-vscode-js",
	dependencies = {
		{ "mfussenegger/nvim-dap" },
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
	},
}

M.config = function()
	require("dap-vscode-js").setup({
		debugger_path = "/home/david/.local/share/nvim/lazy/vscode-js-debug",
		adapters = { "pwa-node" },
	})

	for _, language in ipairs({ "typescript", "javascript" }) do
		require("dap").configurations[language] = {
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				cwd = "${workspaceFolder}",
			},
		}
	end
end

return M
