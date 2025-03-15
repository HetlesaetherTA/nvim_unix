vim.opt.termguicolors = true

require("GlobalConfig")
require("UnixConfig")

vim.g.mapleader = ' '

-- Set background and foreground colors

-- Remove background
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

-- Customize syntax highlighting with the selected color palette
vim.api.nvim_set_hl(0, "Comment", { fg = "#90C379", italic = true })  -- Soft green for comments
vim.api.nvim_set_hl(0, 'Constant', { fg = '#D19A66' })                -- Soft orange for constants
vim.api.nvim_set_hl(0, 'String', { fg = '#E5C07B' })                  -- Soft yellow for strings
vim.api.nvim_set_hl(0, 'Function', { fg = '#61AFEF' })                -- Soft blue for functions
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#56B6C2' })              -- Light blue for identifiers
vim.api.nvim_set_hl(0, 'Statement', { fg = '#C678DD' })               -- Soft purple for statements/keywords
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#ABB2BF' })                 -- Light gray for preprocessor statements
vim.api.nvim_set_hl(0, 'Type', { fg = '#56B6C2' })                    -- Soft cyan for data types
vim.api.nvim_set_hl(0, 'Special', { fg = '#E06C75' })                 -- Soft red for special characters
vim.api.nvim_set_hl(0, 'Underlined', { fg = '#61AFEF', underline = true })  -- Soft blue for underlined text

-- Set custom colors for the completion menu (if needed)
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#282C34', fg = '#ABB2BF' })       -- Normal background and text color
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#61AFEF', fg = '#282C34' })    -- Selected item background and text color
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#282C34' })                   -- Scrollbar background
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#ABB2BF' })                  -- Scrollbar thumb color

-- Optional: Adjust floating window colors (e.g., for LSP pop-ups)
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#282C34', fg = '#ABB2BF' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#282C34', fg = '#ABB2BF' })

-- -- Customize line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5C6370' })  -- Light gray for line numbers
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#D19A66' })  -- Bright orange for current line number

-- -- Customize the color of non-text characters (e.g., tildes in empty lines)
vim.api.nvim_set_hl(0, 'NonText', { fg = '#282C34' })  -- Match the background color to hide tildes

-- -- Treesitter highlight groups
vim.api.nvim_set_hl(0, 'TSComment', { fg = '#98C379', italic = true })  -- Soft green for comments
vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#D19A66' })                -- Soft orange for constants
vim.api.nvim_set_hl(0, 'TSString', { fg = '#E5C07B' })                  -- Soft yellow for strings
vim.api.nvim_set_hl(0, 'TSFunction', { fg = '#61AFEF' })                -- Soft blue for functions
vim.api.nvim_set_hl(0, 'TSVariable', { fg = '#56B6C2' })                -- Light blue for identifiers
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = '#C678DD' })                 -- Soft purple for keywords/statements
vim.api.nvim_set_hl(0, 'TSType', { fg = '#56B6C2' })                    -- Soft cyan for data types
vim.api.nvim_set_hl(0, 'TSSpecial', { fg = '#E06C75' })                 -- Soft red for special characters


