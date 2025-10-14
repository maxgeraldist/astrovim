local cfg = vim.lsp.config;
local config_dir = vim.fn.stdpath("config");

-- 1. Lua
cfg("lua_ls",
    {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { { 'stylua.toml', '.luarc.json' }, '.git' },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "4",
                        continuation_indent = "4",
                        max_line_length = "100",
                        end_statement_with_semicolon = "always"
                    },
                },
            },
        },
    });

vim.lsp.enable("lua_ls");

-- 2. SQL
cfg("sqlls", {
    settings = {
        sql = { format = { enabled = true } },
    },
    filetypes = { "sql" },
    root_dir = function(fname)
        return vim.fs.dirname(fname);
    end,
});
vim.lsp.enable("sqlls");

-- 3. Python
local pylintrc_path = vim.fs.joinpath(config_dir, ".pylintrc");
cfg("pylsp", {
    cmd = { "pylsp" },
    filetypes = { "python" },
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = false, preview = false },
                pylint = {
                    enabled = false,
                    args = { "--rcfile", pylintrc_path }
                },
                ruff = {
                    enabled = true,
                    formatEnabled = true,
                },
            }
        }
    },
});
vim.lsp.enable("pylsp");

-- 4. LaTeX
cfg("texlab", { filetypes = { "tex", "latex", "bibtex" } });
vim.lsp.enable("texlab");

-- 5. LTeX (Grammar checking)
cfg("ltex", {
    settings = { ltex = { language = "en-GB" } },
    filetypes = { "tex", "latex", "bibtex", "markdown" }, -- Also useful for Markdown
});
vim.lsp.enable("ltex");

-- 6. Remark (Markdown)
cfg("remark_ls", {
    settings = { remark = { requireConfig = true } },
    filetypes = { "markdown" },
});
vim.lsp.enable("remark_ls");

-- 7. R Language Server
cfg("r_language_server", {
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r" },
    root_dir = function(fname)
        local root = vim.fs.find({ ".git" }, { path = fname, upward = true });
        return root and root[1] or vim.fs.dirname(fname);
    end,
});

vim.lsp.enable("r_language_server");
vim.diagnostic.config({
    virtual_text = true,      -- inline hints
    signs = true,             -- gutter signs
    underline = true,         -- underline offending code
    update_in_insert = false, -- diagnostics update while inserting
});

local signs = {
    Error = "",
    Warn  = "",
    Hint  = "⚑",
    Info  = ""
};

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type;
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl });
end;
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false });
    end,
});
