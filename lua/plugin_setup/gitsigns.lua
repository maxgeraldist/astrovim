return {
    {
        "lewis6991/gitsigns.nvim",
        event = "Bufread",
        config = function()
            require("gitsigns").setup({
                attach_to_untracked = false,
                max_file_length = 40000,
            });
        end,
    },
};
