local g = vim.g
vim.g.mapleader = ' '

require("GlobalConfig")
require("UnixConfig")
vim.lsp.client_is_stopped()

g.python3_host_prog = "C:/Users/ThAH/AppData/Local/Programs/Python/Python311/python.exe"

vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"


vim.cmd("colorscheme tokyonight")

vim.lsp.client_is_stopped()

g.python3_host_prog = "C:/Users/ThAH/AppData/Local/Programs/Python/Python311/python.exe"
