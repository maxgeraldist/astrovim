return {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    config = true,
    opts = {

        shading_factor = 2,
        direction = "float",
        float_opts = { border = "rounded" },

        on_create = (function()
            local term_maps = {
                { mode = "t", lhs = "<esc>", rhs = [[<C-\><C-n>]] },
                { mode = "t", lhs = "<C-h>", rhs = [[<Cmd>wincmd h<CR>]] },
                { mode = "t", lhs = "<C-j>", rhs = [[<Cmd>wincmd j<CR>]] },
                { mode = "t", lhs = "<C-k>", rhs = [[<Cmd>wincmd k<CR>]] },
                { mode = "t", lhs = "<C-l>", rhs = [[<Cmd>wincmd l<CR>]] },
                { mode = "t", lhs = "<C-w>", rhs = [[<C-\><C-n><C-w>]] },
            };

            local function set_terminal_keymaps(bufnr)
                for _, m in ipairs(term_maps) do
                    vim.keymap.set(m.mode, m.lhs, m.rhs, { buffer = bufnr, silent = true });
                end;
            end;

            return function(t)
                if t and t.winid then
                    pcall(vim.api.nvim_win_set_option, t.winid, "foldcolumn", "0");
                    pcall(vim.api.nvim_win_set_option, t.winid, "signcolumn", "no");
                end;

                if t and t.bufnr then
                    set_terminal_keymaps(t.bufnr);
                end;
            end;
        end)(),
    },
}
;
