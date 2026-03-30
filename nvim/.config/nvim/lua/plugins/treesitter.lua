return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- This isn't the way I've seen plugins set up before... usually just opts= {} but for some reason this needed doing here...
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		ensure_installed = { "python", "c", "lua", "vim", "markdown", "vimdoc" },
		indent = {
			enable = true,
			disable = { "yaml" },
		},
	},
}
