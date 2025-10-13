local lsp  = require('lang_support.lsp_util')

table.insert(_G.hetlesaetherTA_lsp_servers, "jedi-language-server")
table.insert(_G.hetlesaetherTA_lsp_servers, "ruff")
table.insert(_G.hetlesaetherTA_lsp_servers, "pyright")

-- Pyright (types + completion)
lsp.autostart_lsp('python', {
  cmd = { 'pyright-langserver', '--stdio' },
  root_dir = function(buf)
    return vim.fs.root(buf, { 'pyproject.toml', 'setup.cfg', 'setup.py', '.git' })
           or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':p:h')
  end,
})

-- Ruff (diagnostics/code actions; no completion)
lsp.autostart_lsp('python', {
  cmd = { 'ruff', 'server' },
  root_dir = function(buf)
    return vim.fs.root(buf, { 'pyproject.toml', 'ruff.toml', 'setup.cfg', 'setup.py', 'requirements.txt', '.git' })
           or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':p:h')
  end,
})

-- Jedi (completion/hover)
lsp.autostart_lsp('python', {
  cmd = { 'jedi-language-server' },
  root_dir = function(buf)
    return vim.fs.root(buf, { 'pyproject.toml', '.git' })
           or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':p:h')
  end,
  initializationOptions = {
    diagnostics = { enable = false, didOpen = true, didChange = true, didSave = true },
    hover = { enable = true },
    codeAction = { nameExtractVariable = "jls_extract_var", nameExtractFunction = "jls_extract_def" },
    completion = { disableSnippets = false, resolveEagerly = false, ignorePatterns = {} },
    jediSettings = { autoImportModules = {}, caseInsensitiveCompletion = true, debug = false },
    markupKindPreferred = "markdown",
    workspace = { extraPaths = {}, symbols = { ignoreFolders = { ".nox",".tox",".venv","__pycache__","venv" }, maxSymbols = 20 } },
  },
})

