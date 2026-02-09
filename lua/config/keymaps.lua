-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local nnoremap = require("config/helperKeymaps").nnoremap
-- local builtin = require("telescope.builtin")

-- file explorer (netrw)
-- Check if 'nnn' is installed
if vim.fn.executable("nnn") == 1 then
  vim.api.nvim_set_keymap("n", "<leader>pv", ":NnnPicker<CR>", { noremap = true, silent = true })
else
  vim.api.nvim_set_keymap("n", "<leader>pv", "<cmd>Ex<CR>", { noremap = true, silent = true })
end

-- disable space in visual
vim.api.nvim_set_keymap("v", "<Space>", "<Nop>", { noremap = true, silent = true })

-- jump 1 page {up: control+j, down: control+k}
nnoremap("<c-j>", "<c-d>zz<cr>")
nnoremap("<c-k>", "<c-u>zz<cr>")

-- search for file {local: space-p-f, git: control+p, grep: space-p-s}
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<c-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
--   builtin.grep_string({ search = vim.fn.input("grep > ") });
-- end)

-- swap current line with line {below: J, abolve: K}
vim.keymap.set("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- navigate back (n) and forward (n) in search array
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- Save to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- move 1 tab {left: <, right: >}
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- redo bound to shift+u
vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "<leader>g", function()
  vim.diagnostic.open_float(nil, { focus = true, border = "rounded" })
end, { desc = "Line diagnostics" })
