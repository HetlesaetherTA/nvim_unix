local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "williamboman/mason.nvim",
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'folke/tokyonight.nvim', -- Colorscheme
  'williamboman/mason.nvim', -- LSP, DAP, Linter, Formatter
  "williamboman/mason-lspconfig.nvim", -- Mason language server
  "neovim/nvim-lspconfig", -- Nvim language server
  "tpope/vim-commentary", -- Comment out line with gcc & gc
  "ThePrimeagen/vim-be-good", -- Primeagen vim game (:VimBeGood)
  "ap/vim-css-color", -- See color when using rgb(r,g,b) in terminal
  "rust-lang/rust.vim", -- Rust config
  "lambdalisue/suda.vim", -- Force sudo
  "vim-airline/vim-airline", -- Status bar
  "preservim/tagbar", -- Tagbar for code navigation
  -- use "mhartington/formatter.nvim" -- Formatter
  'mbbill/undotree', -- Undotree
  'nvim-lua/plenary.nvim', -- Plenary
  'tpope/vim-fugitive', -- Fugitive
  'tpope/vim-surround', -- Replace code (cs"') "Hello" -> 'Hello'
  'ThePrimeagen/harpoon', -- Harpoon
  'nvim-treesitter/nvim-treesitter', -- syntax highlighting etc
})
