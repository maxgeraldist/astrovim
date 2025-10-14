return {
    "stevearc/resession.nvim",
    opts = {
        config = {
            -- This is the flag that will fix your startup time.
            load_on_startup = false,

            -- This replaces your manual autocmd and is the cleaner way to do it.
            save_on_exit = true,
        },
    },
    config = function(_, opts)
        require("resession").setup(opts);

        -- Your keymaps are perfectly fine and don't affect startup.
        vim.keymap.set("n", "<leader>ss", "<Cmd>lua require('resession').save('last')<CR>",
            { desc = "Save Session" });
        vim.keymap.set("n", "<leader>sl", "<Cmd>lua require('resession').load('last')<CR>",
            { desc = "Load Session" });
        vim.keymap.set("n", "<leader>sd", "<Cmd>lua require('resession').delete('last')<CR>",
            { desc = "Delete Last Session" });
    end,
};
