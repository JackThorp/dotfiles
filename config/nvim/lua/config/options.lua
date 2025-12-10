-- [[ Setting options ]] 
-- See `:h vim.o`
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- Print the line number in front of each line
vim.o.number = true

-- Use relative line numbers
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Enable break indent (not sure if I want this...)
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Controls if/when the column to the left side of numbers is visible.
vim.o.signcolumn = 'auto'

-- How long to wait for a mapped sequence to finish
vim.o.timeoutlen = 300 

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight the line where the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Configure how new splits to open to right and below (rather than left/above)
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list' and `:help 'listchars'`
--  `vim.opt` is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options` and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

vim.o.termguicolors = true
-- vim.o.background = "dark"

