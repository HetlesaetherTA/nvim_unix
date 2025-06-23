table.insert(_G.hetlesaetherTA_lsp_servers, "html")
table.insert(_G.hetlesaetherTA_lsp_servers, "cssls")
table.insert(_G.hetlesaetherTA_lsp_servers, "ts_ls")

local lspconfig = require("lspconfig")

lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.ts_ls.setup({})

