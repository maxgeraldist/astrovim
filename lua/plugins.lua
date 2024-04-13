---@type table
local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},

	require("plugin_setup.treesitter"),
	require("plugin_setup.neotree"),
	require("plugin_setup.toggleterm"),
	require("plugin_setup.lspconfig"),
	require("plugin_setup.cmp"),
	require("plugin_setup.none-ls"),
	require("plugin_setup.alpha"),
	require("plugin_setup.gitsigns"),
	require("plugin_setup.bufferline"),
	require("plugin_setup.coc"),
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		ft = { "python", "lua" },
	},

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},

	{ "onsails/lspkind.nvim", ft = { "python", "lua" } },

	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, lazy = true },
		dependencies = { "fannheyward/telescope-coc.nvim" },
		opts = function(_, opts)
			require("telescope").load_extension("coc")
			if not opts.extensions then
				opts.extensions = {}
			end
			opts.extensions.coc = {
				theme = "ivy",
				prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
			}
		end,
	},

	{
		"stevearc/resession.nvim",
		config = function()
			local resession = require("resession")
			resession.setup()
			vim.api.nvim_set_keymap("n", "<leader>ss", ":lua require('resession').save('last')<CR>", {})
			vim.api.nvim_set_keymap("n", "<leader>sl", ":lua require('resession').load('last')<CR>", {})
			vim.api.nvim_set_keymap("n", "<leader>sd", ":lua require('resession').delete('last')<CR>", {})
			vim.api.nvim_exec(
				[[
            augroup resession_autosave
            autocmd!
            autocmd VimLeavePre * lua require('resession').save('last')
            augroup END
            ]],
				false
			)
		end,
		opts = {},
	},

	{
		"kevinhwang91/nvim-ufo",
		event = { "BufRead", "BufNewFile" },
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{ "mrjones2014/smart-splits.nvim", lazy = true },
	{
		"vhyrro/luarocks.nvim",
		lazy = true,
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{
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
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = { "BufRead", "BufNewFile" },
		dependencies = { "zbirenbaum/copilot-cmp" },
		opts = {
			suggestion = {
				auto_trigger = true,
				debounce = 150,
			},
		},
		config = function()
			require("copilot").setup(opts)
			require("copilot_cmp").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				stages = "fade",
				timeout = 5000,
				background_colour = "#000000",
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
			})
		end,
	},
	{
		"hoob3rt/lualine.nvim",
		event = { "BufRead", "BufNewFile" },
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	},
})

require("plugin_setup.evil_lualine")
