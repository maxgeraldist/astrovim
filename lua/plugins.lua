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
	require("plugin_setup.resession"),
	require("plugin_setup.neorg"),
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		ft = { "python", "lua", "sql" },
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
		dependencies = { "fannheyward/telescope-coc.nvim", "nvim-lua/plenary.nvim" },
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
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "gcc",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "gc",
				---Block-comment keymap
				block = "gb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
		lazy = false,
	},
})

require("plugin_setup.evil_lualine")
