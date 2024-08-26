return {
	-- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			})
		end,
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			autoformat = false,
			inlay_hints = {
				enabled = false,
			},
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},

				ruff_lsp = {
					cmd = { "ruff-lsp" },
					filetypes = { "python" },
					root_dir = function(...)
						return require("lspconfig.util").root_pattern("requirements.txt", "Pipfile")(...)
					end,
					settings = {},
					single_file_support = true,
				},
				pyright = {
					cmd = { "pyright-langserver", "--stdio" },
					filetypes = { "python" },
					settings = {
						pyright = {
							-- Using Ruff's import organizer
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
								ignore = { "*" },
							},
						},
					},
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(
							"pyproject.toml",
							"setup.py",
							"setup.cfg",
							"requirements.txt",
							"Pipfile",
							"pyrightconfig.json",
							".git",
							"main.py",
							"manage.py"
						)(...)
					end,
					single_file_support = true,
				},
				rust_analyzer = {
					cmd = { "rust-analyzer" },
					filetypes = { "rust" },
					root_dir = function(...)
						return require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json")(...)
					end,
					single_file_support = true,
					capabilities = {
						experimental = {
							serverStatusNotification = true,
						},
					},
					settings = {
						["rust-analyzer"] = {
							diagnostics = {
								enable = true,
							},
						},
					},
				},
				sourcekit = {
					cmd = { "sourcekit-lsp" },
					filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
					root_dir = function(...)
						return require("lspconfig.util").root_pattern("Package.swift", ".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = true,
					settings = {
						-- typescript = {
						-- 	inlayHints = {
						-- 		includeInlayParameterNameHints = "literal",
						-- 		includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						-- 		includeInlayFunctionParameterTypeHints = true,
						-- 		includeInlayVariableTypeHints = false,
						-- 		includeInlayPropertyDeclarationTypeHints = true,
						-- 		includeInlayFunctionLikeReturnTypeHints = true,
						-- 		includeInlayEnumMemberValueHints = true,
						-- 	},
						-- },
						-- javascript = {
						-- 	inlayHints = {
						-- 		includeInlayParameterNameHints = "all",
						-- 		includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						-- 		includeInlayFunctionParameterTypeHints = true,
						-- 		includeInlayVariableTypeHints = true,
						-- 		includeInlayPropertyDeclarationTypeHints = true,
						-- 		includeInlayFunctionLikeReturnTypeHints = true,
						-- 		includeInlayEnumMemberValueHints = true,
						-- 	},
						-- },
					},
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
				dartls = {
					cmd = { "dart", "language-server", "--protocol=lsp" },
					filetypes = { "dart" },
					init_options = {
						closingLabels = true,
						flutterOutline = true,
						onlyAnalyzeProjectsWithOpenFiles = true,
						outline = true,
						suggestFromUnimportedLibraries = true,
					},
					root_dir = function(...)
						return require("lspconfig.util").root_pattern("pubspec.yaml")(...)
					end,
					settings = {
						dart = {
							completeFunctionCalls = true,
							showTodos = true,
						},
					},
				},
				gopls = {
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					single_file_support = true,
					root_dir = function(...)
						return require("lspconfig.util").root_pattern("go.work", "go.mod", ".git")(...)
					end,
					settings = {
						gopls = {
							gofumpt = true,
						},
						dart = {
							completeFunctionCalls = true,
							showTodos = true,
						},
					},
				},
			},
			setup = {},
		},

		{
			"glepnir/lspsaga.nvim",
			priority = 1500,
			dependencies = {
				{ "nvim-treesitter/nvim-treesitter" },
			},
			event = "BufRead",
			keys = {
				{ "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic jump next" },
				{ "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic jump prev" },
				{ "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
				{ "gf", "<cmd>Lspsaga finder<CR>" },
				{ "K", "<cmd>Lspsaga hover_doc<CR>" },
				{ "K", "<cmd>Lspsaga hover_doc ++keep<CR>" },
				{ "gp", "<cmd>Lspsaga peek_definition<CR>" },
				{ "re", "<cmd>Lspsaga rename ++project<CR>" },
				{ "gt", "<cmd>Lspsaga peek_type_definition<CR>" },
				{ "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>" },
				{ "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
				{ "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },
				{ "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
				{ "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
				{ "<Leader>o", "<cmd>Lspsaga outline<CR>" },
			},
			config = function()
				require("lspsaga").setup({
					ui = {
						--   -- Currently, only the round theme exists
						theme = "round",
						--   -- This option only works in Neovim 0.9
						title = true,
						--   -- Border type can be single, double, rounded, solid, shadow.
						border = "rounded",
						lines = { "┗", "┣", "┃", "━", "┏" },
						winblend = 1,
						expand = "",
						collapse = "",
						preview = " ",
						code_action = "",
						diagnostic = "🐞",
						incoming = " ",
						outgoing = " ",
						hover = " ",
						imp_sign = "󰳛 ",
						kind = {},
					},
					definition = {
						keys = {
							edit = "<C-c>o",
							vsplit = "<C-c>v",
							split = "<C-c>i",
							tabe = "<C-c>t",
							close = "<C-c>x",
							quit = "q",
						},
					},
					callhierarchy = {
						keys = {
							edit = "<C-c>e",
							vsplit = "<C-c>s",
							split = "<C-c>i",
							tabe = "<C-c>t",
							quit = "<C-c>q",
							shuttle = "<C-c>w",
							toggle_or_req = "<C-c>u",
							close = "<C-c>x",
						},
					},
					diagnostic = {
						keys = {
							quit = { "q", "<ESC>" },
						},
					},
					lightbulb = {
						enable = true,
						enable_in_insert = true,
						sign = true,
						sign_priority = 40,
						virtual_text = true,
					},
					rename = {
						quit = "<C-w>",
						exec = "<CR>",
						mark = "x",
						confirm = "<CR>",
						in_select = true,
					},
					beacon = {
						enable = true,
						frequency = 7,
					},
					outline = {
						detail = false,
						win_width = 50,
					},
				})
				local opts = { noremap = true, silent = true }
			end,
		},

		-- config
		config = function()
			require("lspconfig").pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								enabled = true,
								ignore = { "W391", "E501" },
								maxLineLength = 100,
							},
						},
					},
				},
			})
		end,
	},

	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				mode = "symbol",
				preset = "codicons",
				symbol_map = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "ﰠ",
					Variable = "",
					Class = "ﴯ",
					Interface = "",
					Module = "",
					Property = "ﰠ",
					Unit = "塞",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "פּ",
					Event = "",
					Operator = "",
					TypeParameter = "",
				},
			})
		end,
	},
}
