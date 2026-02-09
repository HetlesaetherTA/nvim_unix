local null = require("null-ls")
local util = require("lang_support.lsp_util")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

util.register("prettierd", "", {})
util.register("stylua", "", {})
util.register("gofumpt", "", {})
util.register("goimports-reviser", "", {})
util.register("golines", "", {})

null.setup({
	sources = {
		-- Go
		null.builtins.formatting.gofumpt,
		null.builtins.formatting.goimports_reviser,
		null.builtins.formatting.golines,

		-- Web
		null.builtins.formatting.prettierd.with({
			filetypes = {
				"html",
				"htmldjango",
				"css",
				"scss",
				"less",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"json",
				"yaml",
				"markdown",
				"svelte",
			},
			prefer_local = "node_modules/.bin",
		}),

		-- Lua
		null.builtins.formatting.stylua,
	},

	on_attach = function(client, bufnr)
		if client.name == "null-ls" and client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						async = false,
						timeout_ms = 3000,
						filter = function(c)
							return c.name == "null-ls"
						end, -- << only null-ls
					})
				end,
			})
		end
	end,
})
