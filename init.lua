require("GlobalConfig")
require("UnixConfig")

vim.g.mapleader = ' '

-- Customize the color of the completion menu
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#3B4252', fg = '#D8DEE9' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#81A1C1', fg = '#2E3440' })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#4C566A' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#D8DEE9' })

-- Customize the color of the LSP pop-up windows
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#3B4252', fg = '#D8DEE9' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#3B4252', fg = '#D8DEE9' })

-- TODO:

-- Document keybinds in README
