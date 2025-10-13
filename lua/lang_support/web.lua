local lsp = require("lang_support.lsp_util")

local web_root = lsp.root_pattern({ "package.json", "tsconfig.json", "jsconfig.json", ".git" })

local formatters = {
	["vscode-html-language-server"] = true,
	["vscode-css-language-server"] = true,
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.html", "*.htm", "*.css", "*.scss", "*.less" },
	callback = function(args)
		vim.lsp.buf.format({ bufnr = args.buf, async = false })
	end,
})

lsp.register("html-lsp", "html", {
	cmd = { "vscode-html-language-server", "--stdio" },
	root_dir = web_root,
	settings = {
		html = {
			format = {
				enable = true,
				wrapLineLength = 120,
				wrapAttributes = "auto",
				endWithNewline = false,
				indentInnerHtml = false,
			},
			suggest = { html5 = true },
			hover = { documentation = true, references = true },
		},
	},
})

lsp.register("css-lsp", { "css", "scss", "less" }, {
	cmd = { "vscode-css-language-server", "--stdio" },
	root_dir = web_root,
	settings = {
		css = { validate = true, lint = { unknownAtRules = "ignore" }, format = { enable = true } },
		scss = { validate = true, lint = { unknownAtRules = "ignore" }, format = { enable = true } },
		less = { validate = true, lint = { unknownAtRules = "ignore" }, format = { enable = true } },
	},
})

lsp.register("typescript-language-server", { "typescript", "typescriptreact", "javascript", "javascriptreact" }, {
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = web_root,
	settings = {
		typescript = {
			format = { semicolons = "insert", convertTabsToSpaces = true, indentSize = 2, tabSize = 2 },
			inlayHints = {
				includeInlayParameterNameHints = "literals",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
			},
			preferences = { quoteStyle = "single", importModuleSpecifier = "non-relative" },
		},
		javascript = {
			format = { semicolons = "insert", convertTabsToSpaces = true, indentSize = 2, tabSize = 2 },
			inlayHints = { includeInlayParameterNameHints = "literals" },
			preferences = { quoteStyle = "single", importModuleSpecifier = "non-relative" },
		},
	},
})
