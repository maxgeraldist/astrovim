return {
	"neovim/nvim-lspconfig",
	ft = { "python", "lua", "tex", "latex", "sql", "markdown" }, -- Added 'markdown' for remark-language-server
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Pyright for Python
		-- Basedpyright for Python
		lspconfig.basedpyright.setup({
			capabilities = capabilities,
			settings = {
				basedpyright = { -- Changed from "python" to "basedpyright"
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						typeCheckingMode = "off", -- This should now work
					},
					formatting = {
						provider = "black",
					},
				},
			},
		})
		-- Lua
		lspconfig.lua_ls.setup({})

		-- SQL
		lspconfig.sqlls.setup({
			settings = {
				sql = {
					format = {
						enabled = true,
					},
				},
			},
			root_dir = function(fname)
				return require("lspconfig").util.path.dirname(fname)
			end,
		})

		-- LaTeX
		lspconfig.texlab.setup({ filetypes = { "tex", "latex", "bibtex" } })

		-- LTeX for grammar checking
		lspconfig.ltex.setup({
			settings = {
				ltex = {
					language = "en-GB",
				},
			},
			filetypes = { "tex", "latex", "bibtex" },
		})

		-- Remark Language Server for Markdown
		lspconfig.remark_ls.setup({
			capabilities = capabilities,
			settings = {
				remark = {
					requireConfig = true,
				},
			},
			filetypes = { "markdown" },
		})
	end,
	dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp" },
}
