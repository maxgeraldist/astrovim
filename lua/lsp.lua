local cfg = vim.lsp.config

-- 1. Lua
cfg("lua_ls",
    { cmd = { "lua-language-server" }, filetypes = { "lua" }, root_markers = { { 'stylua.toml', '.luarc.json' }, '.git' } })

vim.lsp.enable("lua_ls")

-- 2. SQL
cfg("sqlls", {
    settings = {
        sql = { format = { enabled = true } },
    },
    filetypes = { "sql" },
    root_dir = function(fname)
        return vim.fs.dirname(fname)
    end,
})
vim.lsp.enable("sqlls")

-- 3. Python
cfg("basedpyright", {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "off",
                reportUnknownVariableType = false,
            },
        },
    },
})
vim.lsp.enable("basedpyright")

-- 4. LaTeX
cfg("texlab", { filetypes = { "tex", "latex", "bibtex" } })
vim.lsp.enable("texlab")

-- 5. LTeX (Grammar checking)
cfg("ltex", {
    settings = { ltex = { language = "en-GB" } },
    filetypes = { "tex", "latex", "bibtex", "markdown" }, -- Also useful for Markdown
})
vim.lsp.enable("ltex")

-- 6. Remark (Markdown)
cfg("remark_ls", {
    settings = { remark = { requireConfig = true } },
    filetypes = { "markdown" },
})
vim.lsp.enable("remark_ls")

-- 7. R Language Server
cfg("r_language_server", {
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r" },
    root_dir = function(fname)
        local root = vim.fs.find({ ".git" }, { path = fname, upward = true })
        return root and root[1] or vim.fs.dirname(fname)
    end,
})
vim.lsp.enable("r_language_server")
