return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = {
				preset = {
					-- 			header = [[
					--                                                              __,__               z
					--                                                     .--.  .-"     "-.  .--.        z
					-- ████████╗██╗  ██╗ █████╗ ██████╗ ██╗   ██╗██╗      / .. \/  .-. .-.  \/ .. \    z
					-- ╚══██╔══╝██║  ██║██╔══██╗██╔══██╗██║   ██║██║     | |  '|  /   Y   \  |'  | | z
					--    ██║   ███████║███████║██████╔╝██║   ██║██║     | \   \  \ 0 | 0 /  /   / |
					--    ██║   ██╔══██║██╔══██║██╔══██╗██║   ██║██║      \ '- ,\.-"`` ``"-./, -' /
					--    ██║   ██║  ██║██║  ██║██████╔╝╚██████╔╝██║       `'-' /_   ^ ^   _\ '-'`
					--    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝           |  \._   _./  |
					--                |---------------------|                  \   \ `~` /   /
					--                |  能ある鷹は爪を隠す |                   '._ '-=-' _.'
					--                |---------------------|                      '~---~'
					--       ]],
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{
							icon = " ",
							key = "s",
							desc = "Restore Session",
							action = "<Leader>qs",
						},
						{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = { 1, 9, 1, 1 },
					},
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = vim.fn.isdirectory(".git") == 1,
						cmd = "hub status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
					{ section = "startup" },
				},
			},
		},
	},
}
