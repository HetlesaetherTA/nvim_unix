local none_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
  sources = {
    -- Go formatters
    none_ls.builtins.formatting.gofumpt,
    none_ls.builtins.formatting.goimports_reviser,
    none_ls.builtins.formatting.golines,


    -- Web formatters (HTML/CSS/JS/JSON/Markdown/YAML)
    none_ls.builtins.formatting.prettier.with({
      filetypes = {
        "html", "css", "javascript", "typescript",
        "json", "yaml", "markdown"
      },
    }),
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

