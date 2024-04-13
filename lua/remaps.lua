local vim = vim
-- Todo:
-- K to show documentation/definition (for custom functions) for word under cursor - better way than the function below, I think there is a CocAction

-- Normal mode
vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Open Neotree" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Write file" })

vim.keymap.set("n", "cw", '"_cw', { desc = "Delete word without yank" })
vim.keymap.set("n", "cgg", '"_cgg', { desc = "Delete until beginning" })
vim.keymap.set("n", "cG", '"_cG', { desc = "Delete until end" })
vim.keymap.set("n", "cj", '"_cj', { desc = "Delete two lines without yank" })
vim.keymap.set("n", "ck", '"_ck', { desc = "Delete two lines without yank" })
vim.keymap.set("n", "cw", '"_cw', { desc = "Change word without yank" })
vim.keymap.set("n", "c{", '"_c{', { desc = "Change until paragraph start" })
vim.keymap.set("n", "c}", '"_c}', { desc = "Change until paragraph end" })
vim.keymap.set("n", "ciw", '"_ciw', { desc = "Change in word without yank" })
vim.keymap.set("n", "ci'", "\"_ci'", { desc = "Change in single quotes without yank" })
vim.keymap.set("n", 'ci"', '"_ci"', { desc = "Change in double quotes without yank" })
vim.keymap.set("n", "ci(", '"_ci(', { desc = "Change in parentheses without yank" })
vim.keymap.set("n", "ci)", '"_ci)', { desc = "Change in parentheses without yank" })
vim.keymap.set("n", "ci{", '"_ci{', { desc = "Change in braces without yank" })
vim.keymap.set("n", "ci}", '"_ci}', { desc = "Change in braces without yank" })
vim.keymap.set("n", "ci[", '"_ci[', { desc = "Change in brackets without yank" })
vim.keymap.set("n", "ci]", '"_ci]', { desc = "Change in brackets without yank" })
vim.keymap.set("n", "ci<", '"_ci<', { desc = "Change in angle brackets without yank" })
vim.keymap.set("n", "ci>", '"_ci>', { desc = "Change in angle brackets without yank" })
vim.keymap.set("n", "cc", '"_cc', { desc = "Delete line" })
vim.keymap.set("n", "C", '"_C', { desc = "Delete until line end" })

vim.keymap.set("n", "dw", '"_dw', { desc = "Delete word without yank" })
vim.keymap.set("n", "dgg", '"_dgg', { desc = "Delete until beginning" })
vim.keymap.set("n", "dG", '"_dG', { desc = "Delete until end" })
vim.keymap.set("n", "dj", '"_dj', { desc = "Delete two lines without yank" })
vim.keymap.set("n", "dk", '"_dk', { desc = "Delete two lines without yank" })
vim.keymap.set("n", "d}", '"_d}', { desc = "Delete until paragraph end" })
vim.keymap.set("n", "d{", '"_d{', { desc = "Delete until paragraph start" })
vim.keymap.set("n", "diw", '"_diw', { desc = "Delete in word without yank" })
vim.keymap.set("n", "di'", "\"_di'", { desc = "Delete in single quotes without yank" })
vim.keymap.set("n", 'di"', '"_di"', { desc = "Delete in double quotes without yank" })
vim.keymap.set("n", "di(", '"_di(', { desc = "Delete in parentheses without yank" })
vim.keymap.set("n", "di)", '"_di)', { desc = "Delete in parentheses without yank" })
vim.keymap.set("n", "di{", '"_di{', { desc = "Delete in braces without yank" })
vim.keymap.set("n", "di}", '"_di}', { desc = "Delete in braces without yank" })
vim.keymap.set("n", "di[", '"_di[', { desc = "Delete in brackets without yank" })
vim.keymap.set("n", "di]", '"_di]', { desc = "Delete in brackets without yank" })
vim.keymap.set("n", "di<", '"_di<', { desc = "Delete in angle brackets without yank" })
vim.keymap.set("n", "di>", '"_di>', { desc = "Delete in angle brackets without yank" })
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete until line end" })

vim.keymap.set("n", "gg", "gg0", { desc = "First line" })
vim.keymap.set("n", "G", "G$", { desc = "Last line" })
vim.keymap.set("n", "<leader>bn", "<cmd>tabnew<cr>", { desc = "New tab" })
function docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
vim.api.nvim_set_keymap("n", "K", "<cmd>lua docs()<CR>", { noremap = true, silent = true })

-- Visual mode
vim.keymap.set("v", "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "x", "d", { desc = "Cut" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over selection without yanking" })
-- Insert mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit normal mode" })
vim.keymap.set("i", "kk", "<esc>", { desc = "Exit normal mode" })

-- Telescope

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fd",
	"<cmd>Telescope lsp_document_diagnostics<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fc",
	"<cmd>Telescope find_files cwd=~/.config/nvim<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope commands<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope git_bcommits<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>Telescope vim_options<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { noremap = true, silent = true })

-- Splits
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize to the left" })
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize down" })
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize up" })
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize to the right" })
-- moving between splits
vim.keymap.set({ "n", "i" }, "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to the left buffer" })
vim.keymap.set({ "n", "i" }, "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to the lower buffer" })
vim.keymap.set({ "n", "i" }, "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to the upper buffer" })
vim.keymap.set({ "n", "i" }, "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to the right buffer" })
vim.keymap.set(
	{ "n", "i" },
	"<C-\\>",
	require("smart-splits").move_cursor_previous,
	{ desc = "Move to the previous buffer" }
)
-- swapping buffers between windows
vim.keymap.set(
	"n",
	"<leader><leader>h",
	require("smart-splits").swap_buf_left,
	{ desc = "Swap the buffer with the left one" }
)
vim.keymap.set(
	"n",
	"<leader><leader>j",
	require("smart-splits").swap_buf_down,
	{ desc = "Swap the buffer with the lower one" }
)
vim.keymap.set(
	"n",
	"<leader><leader>k",
	require("smart-splits").swap_buf_up,
	{ desc = "Swap the buffer with the upper one" }
)
vim.keymap.set(
	"n",
	"<leader><leader>l",
	require("smart-splits").swap_buf_right,
	{ desc = "Swap the buffer with the right one" }
)

-- Toggleterm
vim.keymap.set(
	"n",
	"<leader>tv",
	"<Cmd>ToggleTerm size=80 direction=vertical<CR>",
	{ desc = "ToggleTerm vertical split" }
)
vim.keymap.set(
	"n",
	"<leader>th",
	"<Cmd>ToggleTerm size=10 direction=horizontal<CR>",
	{ desc = "ToggleTerm horizontal split" }
)

--LSPconfig
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fm",
	'<cmd>lua require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })<CR>',
	{ noremap = true, silent = true }
)
-- Neorg

vim.api.nvim_set_keymap("n", "<Leader>ni", "<cmd>Neorg index <CR>", { noremap = true, silent = true })

-- Bufferline
vim.keymap.set("n", "[b", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous buffer", noremap = true, silent = true })
vim.keymap.set("n", "[B", "<cmd> BufferLineMovePrev <CR>", { desc = "Move buffer left", noremap = true, silent = true })
vim.keymap.set("n", "]b", "<cmd> BufferLineCycleNext <CR>", { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"]B",
	"<cmd> BufferLineMoveNext <CR>",
	{ desc = "Move buffer right", noremap = true, silent = true }
)
vim.keymap.set("n", "<Leader>bc", "<cmd>bp|bd #<CR>", { desc = "Close buffer", noremap = true, silent = true })
