table.insert(_G.hetlesaetherTA_lsp_servers, "lua-language-server")
table.insert(_G.hetlesaetherTA_lsp_servers, "stylua")

local lsp = require("lang_support.lsp_util")

lsp.autostart_lsp("lua", {
  name = "lua_ls",
  cmd = { "lua-language-server" },
  root_dir = function(buf)
    return vim.fs.root(buf, { ".luarc.json", ".luarc.jsonc", ".git" }) or vim.fn.stdpath("config")
  end,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
      },
      completion = {
        callSnippet = "Both",
        keywordSnippet = "Replace",
      },
      hint = { enable = true },
      telemetry = { enable = false },
    },
  },
})
