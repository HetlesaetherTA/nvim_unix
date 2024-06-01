require("mason").setup()
require("lspconfig.configs")

require("mason-lspconfig").setup {
  ensure_installed = {"lua_ls", "gopls"},
  automatic_installation = true,
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local util = require("lspconfig/util")
-- Gopls config

require("lspconfig").gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  -- settings = {
  --   gopls = {
  --     experimentalPostfixCompletions = true,
  --     -- experimentalWorkspaceModule = true
  --     -- expandWorkspaceToModule = true,
  --     analyses = {
  --       unusedparams = true,
  --       shadow = true,
  --     },
  --     staticcheck = true,
  --     codelenses = {
  --       gc_details = true,
  --     }
  --   },
  -- }
}

-- Lua LSP
require("lspconfig").lua_ls.setup {
  settings = {
          Lua = {
              diagnostics = {
                  globals = { 'vim' }
      }
    }
  }
}

-- Rust LSP, Linter & Formatter
require("lspconfig")["rust_analyzer"].setup {
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

require'lspconfig'.ruff_lsp.setup{
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  },
}

-- require("formatter").setup {
--   -- Enable or disable logging
--   logging = true,
--   -- Set the log level
--   log_level = vim.log.levels.WARN,
--   -- All formatter configurations are opt-in
--   filetype = {
--     -- Formatter configurations for filetype "lua" go here
--     -- and will be executed in order
--     lua = {
--       -- "formatter.filetypes.lua" defines default configurations for the
--       -- "lua" filetype
--       require("formatter.filetypes.lua").stylua,

--       -- You can also define your own configuration
--       function()
--         -- Supports conditional formatting
--         if util.get_current_buffer_file_name() == "special.lua" then
--           return nil
--         end

--         -- Full specification of configurations is down below and in Vim help
--         -- files
--         return {
--           exe = "stylua",
--           args = {
--             "--search-parent-directories",
--             "--stdin-filepath",
--             util.escape_path(util.get_current_buffer_file_path()),
--             "--",
--             "-",
--           },
--           stdin = true,
--         }
--       end
--     },

--     -- Use the special "*" filetype for defining formatter configurations on
--     -- any filetype
--     ["*"] = {
--       -- "formatter.filetypes.any" defines default configurations for any
--       -- filetype
--       require("formatter.filetypes.any").remove_trailing_whitespace
--     }
--   }
-- }
