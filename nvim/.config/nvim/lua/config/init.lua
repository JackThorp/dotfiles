local function init()
	-- Set <space> as the leader key
	-- See `:help mapleader`
	-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	-- TODO
	-- Sort out indent
	-- look at performant fzflua https://github.com/ibhagwan/fzf-lua/blob/cae96b04f6cad98a3ad24349731df5e56b384c3c/lua/fzf-lua/profiles/max-perf.lua#L1
	-- line lengths
	-- vertical cursor
	-- check out oil.vim https://github.com/stevearc/oil.nvim
	-- check out nvim github link https://github.com/knsh14/vim-github-link
	--

	require("config.autocmds")
	require("config.lazy")
	require("config.keymaps")
	require("config.options")
	require("config.commands")
	-- require("config.colorscheme")

	-- [[ Add optional packages ]]
	-- Nvim comes bundled with a set of packages that are not enabled by
	-- default. You can enable any of them by using the `:packadd` command.

	-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
	-- 'updatetime' and when going to insert mode
	-- TODO Not sure where this should live yet...
	vim.cmd("packadd! nohlsearch")
end

init()
