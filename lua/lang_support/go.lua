local lsp = require("lang_support.lsp_util")

lsp.register("gopls", "go", {
	cmd = { "gopls" },
	root_dir = lsp.root_pattern({ "go.work", "go.mod", ".git" }),
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
