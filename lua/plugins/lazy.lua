-- Autoinstall lazy if not already installed
local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv or not vim.uv.fs_stat(lazypath) then
	fn.system({
		"hit",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	{
		"ojroques/nvim-osc52", -- clipboard
		config = function()
			require("plugins.clipboard")
		end,
	},
	"morhetz/gruvbox",
	"williamboman/mason.nvim", -- LSP, DAP, Linter, Formatter
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	"norcalli/nvim-colorizer.lua",
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"neovim/nvim-lspconfig", -- Nvim language server
	"tpope/vim-commentary", -- Comment out line with gcc & gc
	"ThePrimeagen/vim-be-good", -- Primeagen vim game (:VimBeGood)
	"NvChad/nvim-colorizer.lua", -- See color when using rgb(r,g,b) in terminal
	"rust-lang/rust.vim", -- Rust config
	"lambdalisue/suda.vim", -- Force sudo
	"vim-airline/vim-airline", -- Status bar
	"preservim/tagbar", -- Tagbar for code navigation
	"mbbill/undotree", -- Undotree
	"nvim-lua/plenary.nvim", -- Plenary
	"tpope/vim-fugitive", -- Fugitive
	"tpope/vim-surround", -- Replace code (cs"') "Hello" -> 'Hello'
	"ThePrimeagen/harpoon", -- Harpoon
	"nvim-treesitter/nvim-treesitter", -- syntax highlighting etc
	"nvimtools/none-ls.nvim", -- auto formatter
	"MunifTanjim/prettier.nvim", -- html formatter engine
	"mcchrish/nnn.vim", -- better file manager
	"windwp/nvim-ts-autotag", -- auto close tags (html, xml, etc)
	"nvim-treesitter/nvim-treesitter-context", -- see function at stop
	"andymass/vim-matchup",
	"lukas-reineke/indent-blankline.nvim",
	"ap/vim-css-color",
	"echasnovski/mini.indentscope",

	{
		"olexsmir/gopher.nvim", -- Go bonus features (Only in GO)
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
			vim.cmd([[
      augroup GopherSetup
        autocmd!
        autocmd FileType go silent! GoInstallDeps
      augroup END
    ]])
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
})
