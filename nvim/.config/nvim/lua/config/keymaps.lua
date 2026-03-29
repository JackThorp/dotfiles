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

-- A command to edit nvim config. Since my config is spread out in different files it seems like the
-- best thing to do on config change is close nvim and reopent rather than try to source the root
-- init.lua (as require imports are cached and not reloaded by default)
-- see https://www.reddit.com/r/neovim/comments/svm0gc/how_to_source_your_lua_config/?rdt=39474
km.set("n", "<leader>ec", ":tabe ~/.config/nvim/lua/config<cr>")

-- shift h and shift l to cycle tabs!
km.set("n", "H", "gT")
km.set("n", "L", "gt")

-- pull <cword> onto search/command line
-- nnoremap <leader> cw "*yiw
km.set("n", "sw", "/<C-R><C-W>/<CR>")
km.set("n", "fw", ":Rg! <C-R><C-W><CR>")
km.set("n", "<leader>rn", ":%s/<C-R><C-W>/")

km.set("n", "<leader>f", require("fzf-lua").files, { desc = "Fzf files" })
km.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Fzf buffers" })
km.set("n", "<leader>h", require("fzf-lua").oldfiles, { desc = "Fzf history" })
km.set(
	"n",
	"<leader>sp",
	":lua require'fzf-lua'.spell_suggest({winopts={relative='cursor',row=1.01,col=0,height=0.2,width=0.2}})<cr>",
	{ desc = "Fzf spellings" }
)
km.set("n", "<leader>r", require("fzf-lua").registers, { desc = "Fzf registers" })
km.set("n", "<leader>g", require("fzf-lua").live_grep, { desc = "Fzf live grep" })
km.set("n", "<leader>sr", require("fzf-lua").resume, { desc = "Fzf [s]earch [r]esume" })

-- Open LSP errors etc in a float if they trail off screen
km.set("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>")

-- Open Oil for filesystem navigation and operations. This opens into buffers current directory.
-- I had this as `:Oil %:p:h<CR>` before but I don't think that's needed...
km.set("n", "-", ":Oil <CR>")

-- Commands for folding via UFO (which uses LSP info)
km.set("n", "zR", require("ufo").openAllFolds)
km.set("n", "zM", require("ufo").closeAllFolds)

function insertFullPath()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", filepath) -- write to clippoard
end

km.set("n", "<leader>p", insertFullPath, { noremap = true, silent = true })

km.set("n", "gs", "<cmd>Git<CR>", { noremap = true, silent = true })

-- Keymaps for ZK-NVIM i.e. zettlekasten
km.set("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>") -- inbound links
km.set("n", "<leader>zl", "<Cmd>ZkLinks<CR>") -- outbound links
km.set("n", "<leader>zs", "<Cmd>ZkNotes<CR>") -- title based search
km.set("n", "<leader>zt", "<Cmd>ZkTags<CR>") -- title based search
km.set("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>") -- insert link to existing
km.set("n", "<leader>zn", function()
	vim.ui.input({ prompt = "Note title: " }, function(title)
		if title and title ~= "" then
			require("zk.commands").get("ZkNew")({ title = title })
		end
	end)
end, { desc = "Create new permanent note with title" })

km.set("n", "<leader>zlt", function()
	vim.ui.input({ prompt = "Literature note title: " }, function(title)
		if title and title ~= "" then
			require("zk.commands").get("ZkNew")({ title = title, dir = "literature", template = "literature.md" })
		end
	end)
end, { desc = "Create new literature note with title" })

km.set("n", "<leader>zfl", function()
	require("zk.commands").get("ZkNew")({ title = "Fleeting note", dir = "fleeting" })
end, { desc = "Create new fleeting note" })
