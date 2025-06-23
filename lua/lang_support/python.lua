table.insert(_G.hetlesaetherTA_lsp_servers, "ruff")
table.insert(_G.hetlesaetherTA_lsp_servers, "judi-language-server")

-- faster python linter
require('lspconfig').ruff.setup{
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  },
}
-- Python LSP, Linter, AutoCorrect & Formatter
require('lspconfig').jedi_language_server.setup {
  initializationOptions = {
    codeAction = {
      nameExtractVariable = "jls_extract_var",
      nameExtractFunction = "jls_extract_def"
    },
    completion = {
      disableSnippets = false,
      resolveEagerly = false,
      ignorePatterns = { }
    },
    diagnostics = {
      enable = false,
      didOpen = true,
      didChange = true,
      didSave = true
    },
    hover = {
      enable = true,
      disable = {
        class = {
          all = false,
          names = { },
          fullNames = { }
        },
        instance = {
          all = false,
          names = { },
          fullNames = { }
        },
        keyword = {
          all = false,
          names = { },
          fullNames = { }
        },
        module = {
          fullNames = { }
        },
        param = {
          all = false,
          names = { },
          fullNames = { }
        },
        path = {
          all = false,
          names = { },
          fullNames = { }
        },
        property = {
          all = false,
          names = { },
          fullNames = { }
        },
        statement = {
          all = false,
          names = { },
          fullNames = { }
        }
      }
    },
    jediSettings = {
      autoImportModules = { },
      caseInsensitiveCompletion = true,
      debug = false
    },
    markupKindPreferred = "markdown",
    workspace = {
      extraPaths = { },
      environmentPath = "/path/to/venv/bin/python",
      symbols = {
        ignoreFolders = { ".nox", ".tox", ".venv", "__pycache__", "venv" },
        maxSymbols = 20
      }
    }
  }
}
