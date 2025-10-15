return {
    "stevearc/resession.nvim",
    opts = {
        config = {
            load_on_startup = false,
            save_on_exit = true,
        },
    },
    config = function(_, opts)
        require("resession").setup(opts);

        vim.keymap.set("n", "<leader>ss", "<Cmd>lua require('resession').save('last')<CR>",
            { desc = "Save Session" });
        vim.keymap.set("n", "<leader>sl", "<Cmd>lua require('resession').load('last')<CR>",
            { desc = "Load Session" });
        vim.keymap.set("n", "<leader>sd", "<Cmd>lua require('resession').delete('last')<CR>",
            { desc = "Delete Last Session" });
    end,
};
