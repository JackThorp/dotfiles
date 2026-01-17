local env = require("config.env")

return {
	"octoenergy/kraken.nvim",
	enabled = env.is_work,
	opts = {},
	config = function()
		require("kraken").setup()
	end,
}
