return {
	"neovim/nvim-lspconfig",
	ft = { "python", "lua" },
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
	end,
	dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp" },
}
