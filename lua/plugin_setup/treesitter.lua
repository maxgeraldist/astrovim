return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ft = { "python", "lua", "sql", "mysql", "r" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua", "vim", "vimdoc", "query", "python", "sql", "r"
            },
            highlight = { enable = true },
            indent = { enable = true },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ic"] = "@class.inner",
                    },
                    selection_modes = {
                        ["@parameter.outer"] = "v",
                        ["@function.outer"] = "V",
                        ["@fold"] = "V",
                        ["@class.outer"] = "<c-v>",
                    },
                    include_surrounding_whitespace = true,
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]l"] = "@loop.outer",
                        ["]z"] = { query = "@fold", query_group = "folds" },
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]L"] = "@loop.outer",
                        ["]Z"] = { query = "@fold", query_group = "folds" },
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[l"] = "@loop.outer",
                        ["[z"] = { query = "@fold", query_group = "folds" },
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[L"] = "@loop.outer",
                        ["[Z"] = "@fold",
                    },
                    goto_next = {
                        ["]d"] = "@conditional.outer",
                        ["]c"] = "@comment.outer",
                    },
                    goto_previous = {
                        ["[d"] = "@conditional.outer",
                        ["[c"] = "@comment.outer",
                    },
                },
                lsp_interop = {
                    enable = true,
                    border = "none",
                    peek_definition_code = {
                        ["<leader>df"] = "@function.outer",
                        ["<leader>dF"] = "@class.outer",
                    },
                },
            },
        });
    end,
};
