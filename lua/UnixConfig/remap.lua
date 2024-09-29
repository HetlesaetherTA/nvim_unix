local nnoremap = require("UnixConfig.keymap").nnoremap
-- local builtin = require("telescope.builtin")

-- file explorer (netrw)
vim.keymap.set('n',"<leader>pv", "<cmd>Ex<cr>")

-- disable space in visual
vim.api.nvim_set_keymap('v', '<Space>', '<Nop>', { noremap = true, silent = true })

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
vim.keymap.set('n', 'J', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', 'K', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- navigate back (n) and forward (n) in search array 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")


-- Save to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- move 1 tab {left: <, right: >}
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- redo bound to shift+u
vim.keymap.set("n", "U", "<C-r>")

-- execute
nnoremap("<leader>rn", "<cmd>!%<CR>")
