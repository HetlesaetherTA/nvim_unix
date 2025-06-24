table.insert(_G.hetlesaetherTA_lsp_servers, "rust_analyzer")

-- Rust LSP, Linter & Formatter
require("lspconfig")["rust_analyzer"].setup {
}
