local M = {
	'glepnir/dashboard-nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'williamboman/mason.nvim',
		'nvim-telescope/telescope.nvim',
	},
}

M.config = function()
	require('dashboard').setup {
		theme = 'doom',
		config = {
			disable_move = true,
			week_header = {
				enable = true,
			},
			center = {
				{
					icon = ' ',
					desc = 'Projects',
					key = 'p',
					keymap = ':Telescope projects',
					action = 'Telescope projects'
				},
				{
					icon = ' ',
					desc = 'Recent',
					key = 'r',
					keymap = ':Telescope oldfiles',
					action = 'Telescope oldfiles'
				},
				{
					icon = ' ',
					desc = 'Search Text',
					key = 't',
					keymap = ':Telescope live_grep',
					action = 'Telescope live_grep'
				},
				{
					icon = ' ',
					desc = 'Settings',
					key = 's',
					keymap = ':edit $MYVIMRC',
					action = 'edit $MYVIMRC'
				},
				{
					icon = '󰒲 ',
					desc = 'Lazy',
					key = 'l',
					keymap = ':Lazy',
					action = 'Lazy'
				},
				{
					icon = '󰺾 ',
					desc = 'Mason',
					key = 'm',
					keymap = ':Mason',
					action = 'Mason'
				},
				{
					icon = '󰿅 ',
					desc = 'Quit',
					key = 'q',
					keymap = ':q',
					action = 'q'
				},
			},
		},
	}
end

return M
