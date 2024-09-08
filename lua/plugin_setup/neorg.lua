return {
	"nvim-neorg/neorg",
	cmd = "Neorg",
	dependencies = { "luarocks.nvim" },
	-- put any other flags you wanted to pass to lazy here!
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Documents/notes",
						},
						default_workspace = "notes",
					},
				},
			},
		})
	end,
}
