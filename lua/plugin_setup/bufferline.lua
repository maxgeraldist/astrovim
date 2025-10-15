return {
    "akinsho/bufferline.nvim",
    event = { "BufRead", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            themable = true,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            offsets = {
                { filetype = "neo-tree", separator = true },
            },
            sort_by = "insert_at_end",
        },
    },
};
