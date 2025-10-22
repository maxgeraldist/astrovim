---@type table
local vim = vim;
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    });
end;
vim.opt.rtp:prepend(lazypath);

require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        compile = true,
        config = function()
            vim.cmd.colorscheme("kanagawa-wave");
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        ft = { "python", "lua", "sql, r" },
    },
    require("plugin_setup.treesitter"),
    require("plugin_setup.neotree"),
    require("plugin_setup.toggleterm"),
    require("plugin_setup.blink"),
    require("plugin_setup.alpha"),
    require("plugin_setup.gitsigns"),
    require("plugin_setup.bufferline"),
    require("plugin_setup.resession"),
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true;
            vim.o.timeoutlen = 300;
            require("which-key").setup({});
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "kevinhwang91/nvim-ufo",
        event = { "BufRead", "BufNewFile" },
        dependencies = "kevinhwang91/promise-async",
        config = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" };
                end,
            });
        end,
    },
    { "mrjones2014/smart-splits.nvim", lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "R-nvim/R.nvim",
        lazy = true,
        ft = "r",
        config = function()
            require("r").setup();

            vim.g.R_objbr_auto_start = 1;
            vim.g.R_rconsole_width = 120;
            vim.g.R_app = "radian";

            -- Key mappings
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>rl",
                "<Plug>RSendLine",
                { desc = "Send line to R", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "v",
                "<Leader>rs",
                "<Plug>RSendSelection",
                { desc = "Send selection to R", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>rp",
                "<Plug>RSPlot",
                { desc = "Sum & plot var under cursor", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>rr",
                "<Plug>RStart",
                { desc = "Start R", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>re",
                "<Plug>RShowEx",
                { desc = "Show examples", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>rd",
                "<Plug>RClearConsole",
                { desc = "Clear R Console", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>rc",
                "<Plug>RClearAll",
                { desc = "Clear All", noremap = true, silent = true }
            );
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>rh",
                "<Plug>RHelp",
                { desc = "Show docs on hover", noremap = true, silent = true }
            );
        end,
    },
    -- {
    -- 	"R-nvim/cmp-r",
    -- 	lazy = true,
    -- 	ft = "r",
    -- },
    {
        "poliquin/stata-vim",
        lazy = true,
        ft = "stata",
    },
    {
        "maxgeraldist/stata-nvim",
        branch = "main",
        ft = { "stata" },
        build =
        "git pull && cd lsp-server && npm init -y && npm install && bun build ./server/src/server.ts --compile --outfile server_bin && cd ..",
        opts = {},
        config = function()
            require("stata-nvim");
        end,
        dependencies = { "human-d3v/term-repl.nvim" },
    },
}, {
    rocks = {
        enabled = false,
    },
});

require("plugin_setup.evil_lualine");

-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" });
