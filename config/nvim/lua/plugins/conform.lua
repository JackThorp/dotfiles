return  {
  "stevearc/conform.nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      svelte = { "prettierd" },
      python={"ruff_fix", "ruff_format"}
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") then
          return
      end
      if bufname:match("/site%-packages/") then
          return
      end
      if bufname:match("/lib/python/") then
          return
      end
      if bufname:match("/Frameworks/Python.framework/") then
          return
      end
      return {timeout_ms = 1000, lsp_format = "fallback" }
    end,
  },
}
