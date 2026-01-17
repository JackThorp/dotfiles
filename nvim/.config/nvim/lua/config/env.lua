local M = {}

M.is_work = function()
	return vim.env.WORK_ENV == "1"
end

return M
