require('nvim-ts-autotag').setup()

require('treesitter-context').setup({
  max_lines = 3,      -- show up to 3 lines of context
  multiline_threshold = 1,
  mode = 'cursor',    -- update on cursor move
  trim_scope = 'inner',
  separator = '-',    -- put a separator line under the context
})

require('nvim-treesitter.configs').setup({
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
  },
  highlight = {
    enable = true,
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
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer", -- Select around a function
        ["if"] = "@function.inner", -- Select inner part of a function
        ["ac"] = "@class.outer",    -- Select around a class
        ["ic"] = "@class.inner",    -- Select inner part of a class
      },
    },
  },
})
