local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind-nvim",
		"windwp/nvim-autopairs",
		"saadparwaiz1/cmp_luasnip",
	},
}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	---@diagnostic disable-next-line: missing-fields
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-k>"] = cmp.mapping.select_prev_item(),
		}),

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}),

		---@diagnostic disable-next-line: missing-fields
		formatting = {
			fields = {
				"kind",
				"abbr",
				"menu",
			},
			format = require("lspkind").cmp_format({
				menu = {
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
				},
				mode = "kind",
			}),
		},
	})

	cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M
