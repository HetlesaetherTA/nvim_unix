local lsp = require("lang_support.lsp_util")

lsp.register("svelte-language-server", "svelte", {
	cmd = { "svelteserver", "--stdio" },
	root_dir = lsp.root_pattern({ "package.json", "svelte.config.js", ".git" }),
	settings = {
		svelte = {
			plugin = {
				svelte = { enable = true },
				css = { enable = true },
				html = { enable = true },
				typescript = { enable = true },
			},
		},
	},
})
