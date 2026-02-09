local omarchy_theme_path = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")

if vim.fn.filereadable(omarchy_theme_path) == 1 then
  -- If Omarchy is present, load the theme from its source
  return dofile(omarchy_theme_path)
else
  -- Fallback for Mac or any system where Omarchy isn't installed
  return {
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },
  }
end
