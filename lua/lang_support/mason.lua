_G.hetlesaetherTA_lsp_servers = _G.hetlesaetherTA_lsp_servers or {}
require("mason").setup({ PATH = "prepend" })

require("lang_support.lua")
-- require("lang_support.go") -- requires go installed
-- require("lang_support.rust") -- requires cargo installed
-- require("lang_support.python") -- requires python3 & node installed
-- require("lang_support.web") -- requires node installed

require("mason-tool-installer").setup({
	ensure_installed = _G.hetlesaetherTA_lsp_servers,
	automatic_installation = true,
})
