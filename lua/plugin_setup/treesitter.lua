return {
	"nvim-treesitter/nvim-treesitter",
	ft = { "python", "lua" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "sql" },
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true,
			},
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Around function" },
							["if"] = { query = "@function.inner", desc = "In function" },
							["al"] = { query = "@loop.outer", desc = "Around loop" },
							["il"] = { query = "@loop.inner", desc = "In loop" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@fold"] = "V",
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = { query = "@function.outer", desc = "Next function start" },
							["]l"] = { query = { "@loop.inner", "@loop.outer" }, desc = "Next loop start" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
						},
						goto_next_end = {
							["]F"] = { query = "@function.outer", desc = "Next function end" },
							["]L"] = { query = { "@loop.inner", "@loop.outer" }, desc = "Next loop end" },
							["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold end" },
						},
						goto_previous_start = {
							["[f"] = { query = "@function.outer", desc = "Previous function start" },
							["[l"] = { query = { "@loop.inner", "@loop.outer" }, desc = "Previous loop start" },
							["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold start" },
						},
						goto_previous_end = {
							["[F"] = { query = "@function.outer", desc = "Previous function end" },
							["[L"] = { query = { "@loop.inner", "@loop.outer" }, desc = "Previous loop end" },
							["[Z"] = { query = "@fold", desc = "Previous fold end" },
						},
						goto_next = {
							["]d"] = { query = "@conditional.outer", desc = "Next conditional" },
							["]c"] = { query = "@comment.outer", desc = "Next comment" },
						},
						goto_previous = {
							["[d"] = { query = "@conditional.outer", desc = "Previous conditional" },
							["[c"] = { query = "@comment.outer", desc = "Previous comment" },
						},
					},
					lsp_interop = {
						enable = true,
						border = "none",
						floating_preview_opts = {},
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
				},
			}),
		})
	end,
}
