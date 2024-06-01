-- lua/config/plugins/dap.lua
local dap = require('dap')
local dap_go = require('dap-go')

-- Set up dap-go
dap_go.setup()

-- Configure dap for Go
dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}', '--log' },
  }
}

dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  }
}


-- Global mappings
vim.keymap.set('n', '<leader>db', '<Cmd>lua require"dap".toggle_breakpoint()<CR>') 
vim.keymap.set('n', '<leader>dus', function()
  local widgets = require('dap.ui.widgets');
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.open();
end)
vim.keymap.set('n', '<leader>n', '<Cmd>DapStepOver<CR>')

-- File specific mappings

-- Go mappings
local function go_dap_mappings()
  local opts = { noremap = true, silent = true, buffer = true }
  vim.keymap.set('n', '<leader>dgt', function()
    require('dap-go').debug_test() end, opts)
  vim.keymap.set('n', '<leader>dgl', function()
    require('dap-go').debug_last() end, opts)
  vim.keymap.set('n', '<leader>t', '<Cmd>lua print("test")<CR>', opts)
end

vim.api.nvim_create_augroup('GoDapMappings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = go_dap_mappings,
  group = 'GoDapMappings'
})
