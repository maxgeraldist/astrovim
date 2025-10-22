local vim = vim;
-- Normal mode

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" });
vim.keymap.set("n", "<leader>q", function() vim.cmd("q"); end, { desc = "Quit" });
vim.keymap.set("n", "<leader>Q", "<Cmd>q!<CR>", { desc = "Force quit" });
vim.keymap.set("n", "<leader>w", function()
    vim.lsp.buf.format({ async = false });
    vim.cmd("w!");
end, { desc = "Format (if LSP) and write file" });
vim.keymap.set("n", "<leader>h", "<Cmd>Alpha<CR>", { desc = "Go to Dashboard" });

vim.keymap.set("n", "cgg", '"_cgg', { desc = "Delete until beginning" });
vim.keymap.set("n", "cG", '"_cG', { desc = "Delete until end" });
vim.keymap.set("n", "cj", '"_cj', { desc = "Delete two lines without yank" });
vim.keymap.set("n", "ck", '"_ck', { desc = "Delete two lines without yank" });
vim.keymap.set("n", "cw", '"_cw', { desc = "Change word without yank" });
vim.keymap.set("n", "c{", '"_c{', { desc = "Change until paragraph start" });
vim.keymap.set("n", "c}", '"_c}', { desc = "Change until paragraph end" });
vim.keymap.set("n", "ciw", '"_ciw', { desc = "Change in word without yank" });
vim.keymap.set("n", "ci'", "\"_ci'", { desc = "Change in single quotes without yank" });
vim.keymap.set("n", 'ci"', '"_ci"', { desc = "Change in double quotes without yank" });
vim.keymap.set("n", "ci(", '"_ci(', { desc = "Change in parentheses without yank" });
vim.keymap.set("n", "ci)", '"_ci)', { desc = "Change in parentheses without yank" });
vim.keymap.set("n", "ci{", '"_ci{', { desc = "Change in braces without yank" });
vim.keymap.set("n", "ci}", '"_ci}', { desc = "Change in braces without yank" });
vim.keymap.set("n", "ci[", '"_ci[', { desc = "Change in brackets without yank" });
vim.keymap.set("n", "ci]", '"_ci]', { desc = "Change in brackets without yank" });
vim.keymap.set("n", "ci<", '"_ci<', { desc = "Change in angle brackets without yank" });
vim.keymap.set("n", "ci>", '"_ci>', { desc = "Change in angle brackets without yank" });
vim.keymap.set("n", "cc", '"_cc', { desc = "Delete line" });
vim.keymap.set("n", "C", '"_C', { desc = "Delete until line end" });

vim.keymap.set("n", "dw", '"_dw', { desc = "Delete word without yank" });
vim.keymap.set("n", "dgg", '"_dgg', { desc = "Delete until beginning" });
vim.keymap.set("n", "dG", '"_dG', { desc = "Delete until end" });
vim.keymap.set("n", "dj", '"_dj', { desc = "Delete two lines without yank" });
vim.keymap.set("n", "dk", '"_dk', { desc = "Delete two lines without yank" });
vim.keymap.set("n", "d}", '"_d}', { desc = "Delete until paragraph end" });
vim.keymap.set("n", "d{", '"_d{', { desc = "Delete until paragraph start" });
vim.keymap.set("n", "diw", '"_diw', { desc = "Delete in word without yank" });
vim.keymap.set("n", "di'", "\"_di'", { desc = "Delete in single quotes without yank" });
vim.keymap.set("n", 'di"', '"_di"', { desc = "Delete in double quotes without yank" });
vim.keymap.set("n", "di(", '"_di(', { desc = "Delete in parentheses without yank" });
vim.keymap.set("n", "di)", '"_di)', { desc = "Delete in parentheses without yank" });
vim.keymap.set("n", "di{", '"_di{', { desc = "Delete in braces without yank" });
vim.keymap.set("n", "di}", '"_di}', { desc = "Delete in braces without yank" });
vim.keymap.set("n", "di[", '"_di[', { desc = "Delete in brackets without yank" });
vim.keymap.set("n", "di]", '"_di]', { desc = "Delete in brackets without yank" });
vim.keymap.set("n", "di<", '"_di<', { desc = "Delete in angle brackets without yank" });
vim.keymap.set("n", "di>", '"_di>', { desc = "Delete in angle brackets without yank" });
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line" });
vim.keymap.set("n", "D", '"_D', { desc = "Delete until line end" });

vim.keymap.set("n", "<leader>uS", function()
    vim.opt_local.conceallevel = vim.wo.conceallevel == 0 and 1 or 0;
end, { desc = "Toggle conceallevel" });

vim.keymap.set("n", "gg", "gg0", { desc = "First line" });
vim.keymap.set("n", "G", "G$", { desc = "Last line" });
vim.keymap.set("n", "<leader>bn", "<cmd>tabnew<cr>", { desc = "New tab" });
-- Visual mode
vim.keymap.set("v", "d", '"_d', { desc = "Delete without yanking" });
vim.keymap.set("v", "x", "d", { desc = "Cut" });
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over selection without yanking" });
-- Insert mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit normal mode" });
vim.keymap.set("i", "kk", "<esc>", { desc = "Exit normal mode" });

-- Telescope
local builtin = require("telescope.builtin");
local config_dir = vim.fn.stdpath("config");

vim.keymap.set("n", "<leader>ff", builtin.find_files,
    { desc = "Find files", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fw", builtin.live_grep,
    { desc = "Find word in directory", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fc", function()
    builtin.find_files({ cwd = config_dir });
end, { desc = "Find config files", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fh", builtin.commands,
    { desc = "Find Telescope commands", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fb", builtin.git_bcommits,
    { desc = "Find Git commits", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fo", builtin.vim_options,
    { desc = "Find Vim options", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fr", builtin.lsp_references,
    { desc = "Find LSP references", noremap = true, silent = true });
vim.keymap.set("n", "<leader>fd", function()
    vim.diagnostic.setqflist();
end, { desc = "List diagnostic errors", noremap = true, silent = true });


-- Splits
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize to the left" });
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize down" });
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize up" });
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize to the right" });
-- moving between splits
vim.keymap.set({ "n", "i" }, "<C-h>", require("smart-splits").move_cursor_left,
    { desc = "Move to the left buffer" });
vim.keymap.set({ "n", "i" }, "<C-j>", require("smart-splits").move_cursor_down,
    { desc = "Move to the lower buffer" });
vim.keymap.set({ "n", "i" }, "<C-k>", require("smart-splits").move_cursor_up,
    { desc = "Move to the upper buffer" });
vim.keymap.set({ "n", "i" }, "<C-l>", require("smart-splits").move_cursor_right,
    { desc = "Move to the right buffer" });
vim.keymap.set(
    { "n", "i" },
    "<C-\\>",
    require("smart-splits").move_cursor_previous,
    { desc = "Move to the previous buffer" }
);
-- swapping buffers between windows
vim.keymap.set(
    "n",
    "<leader><leader>h",
    require("smart-splits").swap_buf_left,
    { desc = "Swap the buffer with the left one" }
);
vim.keymap.set(
    "n",
    "<leader><leader>j",
    require("smart-splits").swap_buf_down,
    { desc = "Swap the buffer with the lower one" }
);
vim.keymap.set(
    "n",
    "<leader><leader>k",
    require("smart-splits").swap_buf_up,
    { desc = "Swap the buffer with the upper one" }
);
vim.keymap.set(
    "n",
    "<leader><leader>l",
    require("smart-splits").swap_buf_right,
    { desc = "Swap the buffer with the right one" }
);

-- Toggleterm
vim.keymap.set(
    "n",
    "<leader>tv",
    "<Cmd>ToggleTerm size=80 direction=vertical<CR>",
    { desc = "ToggleTerm vertical split" }
);

vim.keymap.set(
    "n",
    "<leader>th",
    "<Cmd>ToggleTerm size=10 direction=horizontal<CR>",
    { desc = "ToggleTerm horizontal split" }
);

local Terminal = require("toggleterm.terminal").Terminal;
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true });

vim.keymap.set("n", "<leader>gg", function()
    lazygit:toggle();
end, { desc = "Toggle LazyGit", noremap = true, silent = true });


--LSPconfig
vim.keymap.set(
    "n",
    "gd",
    vim.lsp.buf.definition,
    { desc = "Go to definition", noremap = true, silent = true }
);
vim.keymap.set(
    "n",
    "<leader>fm",
    function()
        require("telescope.builtin").live_grep({
            default_text = vim.fn.expand("<cword>")
        });
    end,
    { desc = "Find word under cursor", noremap = true, silent = true }
);
vim.keymap.set("n", "]g", vim.diagnostic.goto_next,
    { desc = "Next diagnostic", noremap = true, silent = true });
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev,
    { desc = "Previous diagnostic", noremap = true, silent = true });
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" });

-- Bufferline
vim.keymap.set("n", "[b", function()
    require("bufferline").cycle(-1);
end, { desc = "Previous buffer", noremap = true, silent = true });
vim.keymap.set("n", "]b", function()
    require("bufferline").cycle(1);
end, { desc = "Next buffer", noremap = true, silent = true });
vim.keymap.set("n", "[B", function()
    require("bufferline").move(-1);
end, { desc = "Move buffer left", noremap = true, silent = true });
vim.keymap.set("n", "]B", function()
    require("bufferline").move(1);
end, { desc = "Move buffer right", noremap = true, silent = true });
vim.keymap.set("n", "<Leader>c", "<cmd>bp|bd #<CR>",
    { desc = "Close buffer", noremap = true, silent = true });



vim.api.nvim_create_user_command("LspCapabilities", function()
    for _, client in pairs(vim.lsp.get_clients()) do
        local caps = client.server_capabilities;
        print("Client:", client.name);
        print("  Definition:", caps.definitionProvider and "Yes" or "No");
        print("  Rename:", caps.renameProvider and "Yes" or "No");
        print("  Hover:", caps.hoverProvider and "Yes" or "No");
        print("  References:", caps.referencesProvider and "Yes" or "No");
        print("  Formatting:", caps.documentFormattingProvider and "Yes" or "No");
    end;
end, {});
