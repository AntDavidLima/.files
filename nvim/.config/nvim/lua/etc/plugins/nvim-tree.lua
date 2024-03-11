local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	require("nvim-tree").setup({
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = true,
		renderer = {
			group_empty = true,
			icons = {
				glyphs = {
					git = {
						unstaged = "",
						staged = "",
						unmerged = "",
						renamed = "",
						untracked = "",
						deleted = "",
						ignored = "",
					},
				},
			},
		},
		diagnostics = {
			show_on_dirs = true,
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		modified = {
			enable = true,
		},
		filters = {
			git_ignored = false,
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			local function edit_or_open()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file
					api.node.open.edit()
				end
			end

			vim.keymap.set("n", "l", edit_or_open, opts("Edit or open"))
		end,
	})

	vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

	vim.api.nvim_create_autocmd("QuitPre", {
		callback = function()
			local invalid_win = {}
			local wins = vim.api.nvim_list_wins()
			for _, w in ipairs(wins) do
				local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
				if bufname:match("NvimTree_") ~= nil then
					table.insert(invalid_win, w)
				end
			end
			if #invalid_win == #wins - 1 then
				-- Should quit, so we close all invalid windows.
				for _, w in ipairs(invalid_win) do
					vim.api.nvim_win_close(w, true)
				end
			end
		end,
	})

	vim.api.nvim_create_autocmd({ "VimEnter" }, {
		callback = function(data)
			-- buffer is a directory
			local directory = vim.fn.isdirectory(data.file) == 1

			if not directory then
				return
			end

			-- create a new, empty buffer
			vim.cmd.enew()

			-- wipe the directory buffer
			vim.cmd.bw(data.buf)

			-- change to the directory
			vim.cmd.cd(data.file)

			-- open the tree
			require("nvim-tree.api").tree.open()
		end,
	})
end

return M
