table.insert(_G.hetlesaetherTA_lsp_servers, "lua_ls")

require("lspconfig").lua_ls.setup {
  settings = {
          Lua = {
              diagnostics = {
                  globals = { 'vim' }
      }
    }
  }
}
