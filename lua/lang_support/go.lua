local util = require("lspconfig/util")

table.insert(_G.hetlesaetherTA_lsp_servers, "gopls")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require("lspconfig").gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      experimentalPostfixCompletions = true,
      -- experimentalWorkspaceModule = true
      -- expandWorkspaceToModule = true,
      analyses = {
        unusedparams = true,
        -- shadow = true,
      },
      -- staticcheck = true,
      -- codelenses = {
        -- gc_details = true,
      -- }
    },
  }
}
