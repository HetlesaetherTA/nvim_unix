-- flip this to false if you want to turn Go off without deleting the file
local enabled = true
if not enabled then
  return {}
end

return {
  -- 1) Ensure gopls is installed by mason-lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "gopls") then
        table.insert(opts.ensure_installed, "gopls")
      end
      return opts
    end,
  },

  -- 2) Configure gopls
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- use your helper module from nvim_unix
      local ok, lsp = pcall(require, "lang_support.lsp_util")
      if not ok then
        return opts
      end

      lsp.register("gopls", "go", {
        cmd = { "gopls" },
        root_dir = lsp.root_pattern({ "go.work", "go.mod", ".git" }),
        settings = {
          gopls = {
            staticcheck = true,
            gofumpt = true,
            completeUnimported = true,
            usePlaceholders = true,
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              nilness = true,
              unusedwrite = false,
            },
            directoryFilters = { "-**/vendor", "-**/node_modules" },
            hoverKind = "FullDocumentation",
            matcher = "Fuzzy",
          },
        },
      })

      return opts
    end,
  },
}
