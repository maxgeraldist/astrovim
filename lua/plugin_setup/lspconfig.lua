return {
    "neovim/nvim-lspconfig",
    ft = { "python", "lua", "tex", "latex", "sql", "markdown", "r" },
    config = function()
        -- use vim.lsp.config to register server configs, then enable them
        local cfg = vim.lsp.config

        -- Lua
        cfg("lua_ls", {})
        vim.lsp.enable("lua_ls")

        -- SQL
        cfg("sqlls", {
            settings = {
                sql = { format = { enabled = true } },
            },
            filetypes = { "sql" },
            -- prefer vim.fs (neovim core) for simple path helpers
            root_dir = function(fname)
                return vim.fs.dirname(fname)
            end,
        })
        vim.lsp.enable("sqlls")

        -- Python (basedpyright)
        cfg("basedpyright", {
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

        -- LaTeX
        cfg("texlab", { filetypes = { "tex", "latex", "bibtex" } })
        vim.lsp.enable("texlab")

        -- LTeX for grammar checking
        cfg("ltex", {
            settings = { ltex = { language = "en-GB" } },
            filetypes = { "tex", "latex", "bibtex" },
        })
        vim.lsp.enable("ltex")

        -- Remark Language Server for Markdown
        -- If you want to set capabilities globally you can do it via vim.lsp.config('*', { capabilities = ... })
        cfg("remark_ls", {
            settings = { remark = { requireConfig = true } },
            filetypes = { "markdown" },
        })
        vim.lsp.enable("remark_ls")

        -- R Language Server
        cfg("r_language_server", {
            cmd = { "R", "--slave", "-e", "languageserver::run()" },
            filetypes = { "r" },
            -- root detection: try .git else buffer dir
            root_dir = function(fname)
                -- you can use vim.fs.find or vim.fs.dirname here
                return vim.fs.find({ ".git" }, { path = fname, upward = true }) and
                    vim.fs.find({ ".git" }, { path = fname, upward = true })[1]
                    or vim.fs.dirname(fname)
            end,
        })
        vim.lsp.enable("r_language_server")
    end
}
