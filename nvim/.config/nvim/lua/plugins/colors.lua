return {
	"tinted-theming/tinted-nvim",
	config = function()
		require("tinted-colorscheme").setup(nil, {
			supports = {
				tinty = true,
				live_reload = true,
			},
		})
	end,
}
