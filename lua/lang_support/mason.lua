_G.hetlesaetherTA_lsp_servers = _G.hetlesaetherTA_lsp_servers or {}
require("mason").setup({ PATH = "prepend" })

require("lang_support.go")
-- require("lang_support.rust")
require("lang_support.python")
require("lang_support.lua")
-- require("lang_support.web")

require("mason-tool-installer").setup({
	ensure_installed = _G.hetlesaetherTA_lsp_servers,
	automatic_installation = true,
})
