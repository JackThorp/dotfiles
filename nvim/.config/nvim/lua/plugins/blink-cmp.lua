return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
		},
		sources = {
			default = { "lsp", "path", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
