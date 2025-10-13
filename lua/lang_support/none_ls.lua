local null = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null.setup({
  sources = {
    -- Go formatters
    null.builtins.formatting.gofumpt,
    null.builtins.formatting.goimports_reviser,
    null.builtins.formatting.golines,


    -- Web formatters (HTML/CSS/JS/JSON/Markdown/YAML)
    null.builtins.formatting.prettier.with({
      filetypes = {
        "html", "css", "javascript", "typescript",
        "json", "yaml", "markdown"
      },
    }),

    -- Lua formatters
    null.builtins.formatting.stylua, -- uses your stylua.toml

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

