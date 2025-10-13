table.insert(_G.hetlesaetherTA_lsp_servers,  "rust-analyzer")
local lsp = require("lang_support.lsp_util")

-- Start rust-analyzer on Rust files
lsp.autostart_lsp('rs', {
  cmd = { 'rust-analyzer' },  
  root_dir = function(buf)
    return vim.fs.root(buf, { 'Cargo.toml', 'rust-project.json', '.git' })
  end,
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true },
      check = { command = 'clippy' },
      inlayHints = { locationLinks = false },
    },
  },
})
