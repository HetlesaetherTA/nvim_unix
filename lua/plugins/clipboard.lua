-- NOTE: disabled by default by tmux, if using tmux add "set-option -g set-clipboard on" to tmux config
local osc52 = require("osc52")

osc52.setup()

-- Visual mode: <leader>y or <C-S-c> to copy selected lines
vim.keymap.set('v', '<leader>y', osc52.copy_visual)
vim.keymap.set('v', '<C-S-c>', osc52.copy_visual)

-- Normal mode: <leader>yy to copy current line
vim.keymap.set('n', '<leader>yy', function()
  osc52.copy_visual()
end, { noremap = true })
