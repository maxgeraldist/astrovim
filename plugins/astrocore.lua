---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      copilot_no_tab_map = true, --vim.g.copilot_no_tab_map
      termguicolors = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        autochdir = true,
      },
      g = { -- vim.g.<key>
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["ciw"] = { '"_ciw', desc = "Change in word without yank" },
        ["ci'"] = { "\"_ci'", desc = "Change in single quotes without yank" },
        ['ci"'] = { '"_ci"', desc = "Change in double quotes without yank" },
        ["ci("] = { '"_ci(', desc = "Change in parentheses without yank" },
        ["ci)"] = { '"_ci)', desc = "Change in parentheses without yank" },
        ["ci{"] = { '"_ci{', desc = "Change in braces without yank" },
        ["ci}"] = { '"_ci}', desc = "Change in braces without yank" },
        ["ci["] = { '"_ci[', desc = "Change in brackets without yank" },
        ["ci]"] = { '"_ci]', desc = "Change in brackets without yank" },
        ["ci<"] = { '"_ci<', desc = "Change in angle brackets without yank" },
        ["ci>"] = { '"_ci>', desc = "Change in angle brackets without yank" },
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>b"] = { name = "Buffers" },

        -- For normal mode deletion
        ["gg"] = { "gg0", desc = "Go to the start of the document" },
        ["G"] = { "G$", desc = "Go to the end of the document" },
        ["dd"] = { '"_dd', desc = "Delete line without yank" },
        ["d"] = { '"_d', desc = "Delete without yank" },
        ["D"] = { '"_D', desc = "Delete to end of line without yank" },
        ["x"] = { '"_x', desc = "Delete character without yank" },
        ["X"] = { "d", desc = "Cut" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        -- For visual mode deletion
        ["d"] = { '"_d', desc = "Delete selection without yank" },
        ["x"] = { "d", desc = "Cut selection" },
        ["gg"] = { "gg0", desc = "Go to the start of the document" },
        ["G"] = { "G$", desc = "Go to the end of the document" },
      },
      i = {
        ["C-l"] = { "copilot#Accept(<Tab>)", silent = true, expr = true, script = true }, -- Copilot
        ["C-k"] = { "copilot#Reject(<Tab>)", silent = true, expr = true, script = true }, --
      },
    },
  },
}
