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
  'morhetz/gruvbox',
  'williamboman/mason.nvim', -- LSP, DAP, Linter, Formatter
  'mfussenegger/nvim-dap',
  'leoluz/nvim-dap-go',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  "williamboman/mason-lspconfig.nvim", -- Mason language server
  "neovim/nvim-lspconfig", -- Nvim language server
  "tpope/vim-commentary", -- Comment out line with gcc & gc
  "ThePrimeagen/vim-be-good", -- Primeagen vim game (:VimBeGood)
  "ap/vim-css-color", -- See color when using rgb(r,g,b) in terminal
  "rust-lang/rust.vim", -- Rust config
  "lambdalisue/suda.vim", -- Force sudo
  "vim-airline/vim-airline", -- Status bar
  "preservim/tagbar", -- Tagbar for code navigation
  'mbbill/undotree', -- Undotree
  'nvim-lua/plenary.nvim', -- Plenary
  'tpope/vim-fugitive', -- Fugitive
  'tpope/vim-surround', -- Replace code (cs"') "Hello" -> 'Hello'
  'ThePrimeagen/harpoon', -- Harpoon
  'nvim-treesitter/nvim-treesitter', -- syntax highlighting etc
  'jose-elias-alvarez/null-ls.nvim', -- auto formatter
  'MunifTanjim/prettier.nvim', -- html formatter engine
  {
  'olexsmir/gopher.nvim', -- Go bonus features (Only in GO)
  ft = 'go',
  config = function(_, opts)
    require("gopher").setup(opts)
    vim.cmd [[
      augroup GopherSetup
        autocmd!
        autocmd FileType go silent! GoInstallDeps
      augroup END
    ]]
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
  },
  {
  'norcalli/nvim-colorizer.lua',
  config = function()
  require('colorizer').setup({
    '*'; -- Enable for all file types
  })

  -- Autocmd to automatically attach Colorizer when entering any buffer
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    command = 'ColorizerAttachToBuffer'
  })
  end

  },
})


