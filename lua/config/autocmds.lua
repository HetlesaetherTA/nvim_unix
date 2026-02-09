-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Close netrw with <C-c>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<C-c>", function()
      -- Alternate buffer (what :b# / <C-^> uses)
      local alt = vim.fn.bufnr("#")

      local function has_meaningful_alt(buf)
        if buf == -1 or buf == 0 then
          return false
        end
        if not vim.api.nvim_buf_is_loaded(buf) then
          return false
        end

        local name = vim.api.nvim_buf_get_name(buf)
        if name == "" then
          -- Usually "[No Name]" or similar → treat as "no real file"
          return false
        end

        -- Don't consider another netrw buffer as a target
        local ft = vim.bo[buf].filetype
        if ft == "netrw" then
          return false
        end

        return true
      end

      if has_meaningful_alt(alt) then
        -- Go back to the previous file/buffer
        vim.cmd("buffer #")
      else
        -- No meaningful previous buffer → probably `nvim .` → quit
        vim.cmd("quit")
      end
    end, { buffer = true, silent = true, desc = "Exit netrw or go back" })
  end,
})
