local lsp = require('lang_support.lsp_util')

table.insert(_G.hetlesaetherTA_lsp_servers, "html-lsp")
table.insert(_G.hetlesaetherTA_lsp_servers, "css-lsp")
table.insert(_G.hetlesaetherTA_lsp_servers, "typescript-language-server")


-- HTML format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.html", "*.htm", "*.css", "*.scss", "*.less" },
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
      filter = function(client)
        local n = client.name
        return n == "vscode-html-language-server" or n == "vscode-css-language-server"
      end,
    })
  end,
})


-- HTML
lsp.autostart_lsp('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  root_dir = function(buf) return vim.fs.root(buf, { 'package.json', '.git' }) end,
  settings = {
    html = {
      format = {
        enable = true,
        wrapLineLength = 120,
        wrapAttributes = "auto", -- "auto" | "force" | "force-aligned"
        endWithNewline = false,
        indentInnerHtml = false,
      },
      suggest = { html5 = true },
      hover = { documentation = true, references = true },
    },
  },
})

-- CSS
lsp.autostart_lsp('css', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  root_dir = function(buf) return vim.fs.root(buf, { 'package.json', '.git' }) end,
  settings = {
    css  = { validate = true,  lint = { unknownAtRules = "ignore" }, format = { enable = true } },
    scss = { validate = true,  lint = { unknownAtRules = "ignore" }, format = { enable = true } },
    less = { validate = true,  lint = { unknownAtRules = "ignore" }, format = { enable = true } },
  },
})

-- TS / JS
lsp.autostart_lsp({ 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' }, {
  cmd = { 'typescript-language-server', '--stdio' },
  root_dir = function(buf)
    return vim.fs.root(buf, { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' })
  end,
  settings = {
    typescript = {
      format = {
        semicolons = "insert",
        convertTabsToSpaces = true,
        indentSize = 2,
        tabSize = 2,
        insertSpaceAfterConstructor = true,
        insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
        insertSpaceAfterKeywordsInControlFlowStatements = true,
        insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
      },
      inlayHints = {
        includeInlayParameterNameHints = "literals",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = false,
      },
      preferences = {
        quoteStyle = "single",                 -- "auto" | "single" | "double"
        importModuleSpecifier = "non-relative" -- or "relative", "shortest"
      },
    },
    javascript = {
      -- mirror TS settings for JS files
      format = { semicolons = "insert", convertTabsToSpaces = true, indentSize = 2, tabSize = 2 },
      inlayHints = { includeInlayParameterNameHints = "literals" },
      preferences = { quoteStyle = "single", importModuleSpecifier = "non-relative" },
    },
  },
})
