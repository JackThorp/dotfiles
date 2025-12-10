-- [[ Set up keymaps ]]
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

local km = vim.keymap

-- Use <Esc> to exit terminal mode AND clear highlights in normal mode.
km.set("t", "<Esc>", "<C-\\><C-n>")
km.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
km.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

km.set("n", "<leader><leader>x", "<cmd>source %<CR>")

-- remappings to run single line (or visual selection) of lua
km.set("n", "<leader>x", ":.lua<CR>")
km.set("v", "<leader>x", ":lua<CR>")

km.set("n", "<C-j>", ":cn<CR>")
km.set("n", "<C-k>", ":cp<CR>")

-- pull <cword> onto search/command line
-- nnoremap <leader> cw "*yiw
km.set("n", "sw", "/<C-R><C-W>/<CR>")
km.set("n", "fw", ":Rg! <C-R><C-W><CR>")

km.set("n", "<leader>f", require("fzf-lua").files, { desc = "Fzf files" })
km.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Fzf buffers" })
km.set("n", "<leader>h", require("fzf-lua").oldfiles, { desc = "Fzf history" })
km.set(
	"n",
	"<leader>s",
	":lua require'fzf-lua'.spell_suggest({winopts={relative='cursor',row=1.01,col=0,height=0.2,width=0.2}})<cr>",
	{ desc = "Fzf spellings" }
)
km.set("n", "<leader>r", require("fzf-lua").registers, { desc = "Fzf registers" })
km.set("n", "<leader>g", require("fzf-lua").live_grep, { desc = "Fzf live grep" })
