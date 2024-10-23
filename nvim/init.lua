if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

-- require("lspconfig").ruff_lsp.setup({
-- 	init_options = {
-- 		settings = {
-- 			-- Any extra CLI arguments for `ruff` go here.
-- 			args = {},
-- 		},
-- 	},
-- })
--
-- local on_attach = function(client, bufnr)
-- 	if client.name == "ruff_lsp" then
-- 		-- Disable hover in favor of Pyright
-- 		client.server_capabilities.hoverProvider = false
-- 	end
-- end

-- require("lspconfig").ruff_lsp.setup({
-- 	on_attach = on_attach,
-- })

require("lspconfig").pyright.setup({
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = false,
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				-- ignore = { "*" },
			},
		},
	},
})
