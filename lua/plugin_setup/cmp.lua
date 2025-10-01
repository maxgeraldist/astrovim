return {
    "hrsh7th/nvim-cmp",
    ft = { "python", "lua" },
    config = function()
        local cmp = require("cmp")

        vim.opt.completeopt = "menu,menuone,noselect"

        -- Custom kind icons (letters or symbols)
        local kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = " ",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
        }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<M-k>"] = cmp.mapping.select_prev_item(),
                ["<M-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }),
            experimental = { ghost_text = true },
            formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
                    return vim_item
                end,
            },
        })
    end,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
}
