return {
    "Saghen/blink.cmp",
    version = "1.*",
    ft = { "python", "lua", "stata" },
    config = function()
        local blink = require("blink.cmp");

        vim.opt.completeopt = "menu,menuone,noselect";
        blink.setup({
            completion = {
                list = { selection = { preselect = false, auto_insert = true } },
                documentation = {
                    auto_show = true,
                },
                ghost_text = {
                    enabled = true,
                },
            },
            keymap = {
                preset = "default",
                ["<M-k>"] = { "select_prev", "fallback" },
                ["<M-j>"] = { "select_next", "fallback" },
            },
        });
    end,
};
