return {
	"neovim/nvim-lspconfig",
	ft = { "python", "lua", "tex", "latex", "sql" },
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.pyright.setup({
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
					formatting = {
						provider = "black",
					},
				},
			},
		})
		lspconfig.lua_ls.setup({})
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
		lspconfig.texlab.setup({})
		lspconfig.ltex.setup({
			settings = {
				ltex = {
					language = "en-GB",
				},
			},
		})
	end,
	dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp" },
}
