local colorscheme = "mellow"

-- pcall is protected call. This seems like exception handling in Lua?
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
