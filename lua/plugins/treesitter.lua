require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "typescript",
    "vim",
    "yaml",
  }, -- Install all listed parsers
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",    -- Start selection with gnn
      node_incremental = "grn",  -- Increment selection with grn
      scope_incremental = "grc", -- Increment scope with grc
      node_decremental = "grm",  -- Decrement selection with grm
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,          -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ["af"] = "@function.outer", -- Select around a function
        ["if"] = "@function.inner", -- Select inner part of a function
        ["ac"] = "@class.outer",    -- Select around a class
        ["ic"] = "@class.inner",    -- Select inner part of a class
      },
    },
  },
}
