local lsp = require("lang_support.lsp_util")

table.insert(_G.hetlesaetherTA_lsp_servers, "gopls") -- mason package id

lsp.autostart_lsp("go", {
	cmd = { "gopls" },
	root_dir = function(buf)
		return vim.fs.root(buf, { "go.work", "go.mod", ".git" })
	end,
	settings = {
		gopls = {
			staticcheck = true,
			gofumpt = true,
			completeUnimported = true,
			usePlaceholders = true,
			experimentalPostfixCompletions = true,
			analyses = { unusedparams = true, nilness = true, unusedwrite = false },
			directoryFilters = { "-**/vendor", "-**/node_modules" },
			hoverKind = "FullDocumentation",
			matcher = "Fuzzy",
		},
	},
})
