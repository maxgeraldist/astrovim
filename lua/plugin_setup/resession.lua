return {
    "stevearc/resession.nvim",
    config = function()
        local resession = require("resession")
        resession.setup()
        vim.api.nvim_set_keymap(
            "n",
            "<leader>ss",
            ":lua require('resession').save('last')<CR>",
            { desc = "Save Session" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>sl",
            ":lua require('resession').load('last')<CR>",
            { desc = "Load Session" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>sd",
            ":lua require('resession').delete('last')<CR>",
            { desc = "Delete Last Session" }
        )
        vim.api.nvim_exec(
            [[
            augroup resession_autosave
            autocmd!
            autocmd VimLeavePre * lua require('resession').save('last')
            augroup END
            ]],
            false
        )
    end,
    opts = {},
}
