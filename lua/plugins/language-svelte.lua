-- Toggle this to false to disable Web/Svelte support without deleting the file
local enabled = true
if not enabled then
  return {}
end

return {
  -- 1) Ensure Svelte and supporting servers are installed by Mason
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "html",
        "cssls",
        "ts_ls",
        "svelte", -- Specifically ensures svelte-language-server is installed
      })
      return opts
    end,
  },
  -- Treesitter for text highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "svelte", "css", "html", "javascript", "typescript" })
      end
    end,
  },

  -- 2) Configure Language Servers (LSP)
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local ok, lsp = pcall(require, "lang_support.lsp_util")
      if not ok then
        return opts
      end

      -- Root pattern for Svelte/Web projects
      local web_root = lsp.root_pattern({ "package.json", "svelte.config.js", "tsconfig.json", ".git" })

      -- Svelte Language Server registration
      lsp.register("svelte", "svelte", {
        cmd = { "svelteserver", "--stdio" },
        root_dir = web_root,
        settings = {
          svelte = {
            plugin = {
              -- Enable cross-language support inside .svelte files
              svelte = { enable = true },
              css = { enable = true },
              html = { enable = true },
              typescript = { enable = true },
            },
          },
        },
      })

      -- Include your other web servers here (html, cssls, ts_ls) as shown previously

      return opts
    end,
  },
}
