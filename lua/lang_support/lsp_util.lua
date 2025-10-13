local M = {}


local caps = require('cmp_nvim_lsp').default_capabilities()
M.caps = caps

function M.autostart_lsp(ft, cfg)
  local group = vim.api.nvim_create_augroup(("LspStart:%s"):format(cfg.name or (cfg.cmd and cfg.cmd[1]) or "noname"), { clear = true })

  vim.api.nvim_create_autocmd('FileType', { 
    group = group,
    pattern = ft,
    callback = function(args)
      local c = vim.deepcopy(cfg or {})

      c.capabilities = c.capabilities or caps
      vim.lsp.start(c)
    end
  })
end    

return M
