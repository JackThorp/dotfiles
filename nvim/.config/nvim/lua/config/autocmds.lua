-- Autocommands
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

local api = vim.api

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- set spelling utils for certain filetypes
api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "text", "latex", "NeogitCommitMessage" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = "en_gb"
    vim.keymap.set("i", "<c-i>", "<c-g>u<Esc>[s1z=`]a<c-g>u") -- correct spelling mistakes on the fly
  end,
})

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can increase startup-time. 
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

