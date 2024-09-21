return {
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		cmd = "Neogen",
		keys = {
			{
				"<leader>ng",
				function()
					require("neogen").generate()
				end,
				desc = "Generate Annotations (Neogen)",
			},
			{
				"<leader>nf",
				function()
					require("neogen").generate({ type = "func" })
				end,
				desc = "Generate Annotations (Neogen)",
			},
			{
				"<leader>nc",
				function()
					require("neogen").generate({ type = "class" })
				end,
				desc = "Generate Annotations (Neogen)",
			},
			{
				"<leader>nt",
				function()
					require("neogen").generate({ type = "type" })
				end,
				desc = "Generate Annotations (Neogen)",
			},
		},
		opts = function(_, opts)
			if opts.snippet_engine ~= nil then
				return
			end

			local map = {
				["LuaSnip"] = "luasnip",
				["nvim-snippy"] = "snippy",
				["vim-vsnip"] = "vsnip",
			}

			for plugin, engine in pairs(map) do
				if LazyVim.has(plugin) then
					opts.snippet_engine = engine
					return
				end
			end

			if vim.snippet then
				opts.snippet_engine = "nvim"
			end
		end,
	},

	--auto pairs
	{ "echasnovski/mini.nvim", version = "*" },
	{
		"echasnovski/mini.icons",
		version = "*",
		opts = {
			style = "glyph",
		},
		lazy = true,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		}, -- this is equalent to setup({}) function
	},
	-- {
	-- 	"ZhiyuanLck/smart-pairs",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("pairs"):setup()
	-- 	end,
	-- },

	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({
				input_buffer_type = "dressing",
				vim.keymap.set("n", "<leader>rn", ":IncRename "),
			})
		end,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},

	{
		"nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",

			{
				"Exafunction/codeium.nvim",
				cmd = "Codeium",
				build = ":Codeium Auth",
				opts = {},
			},
		},
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })

			table.insert(opts.sources, 1, {
				name = "codeium",
				group_index = 1,
				priority = 100,
			})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				size = 20,
				shade_filetypes = {},
				direction = "float",
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				terminal_mappings = true,
				persist_size = true,
				close_on_exit = true,
				shell = vim.o.shell,
				auto_scroll = true,
				float_otps = {
					border = "curved",
					winblend = 2,
					width = 1,
					height = 1,
				},
				winbar = {
					enable = false,
					name_formatter = function(term)
						return term.name
					end,
				},
			})
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
}
