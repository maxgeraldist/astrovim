return {
  {
    "svermeulen/vim-yoink",
    lazy = false,
    config = function()
      vim.api.nvim_set_keymap("n", "<c-n>", "<plug>(YoinkPostPasteSwapBack)", {})
      vim.api.nvim_set_keymap("n", "<c-p>", "<plug>(YoinkPostPasteSwapForward)", {})
      vim.api.nvim_set_keymap("n", "p", "<plug>(YoinkPaste_p)", {})
      vim.api.nvim_set_keymap("n", "P", "<plug>(YoinkPaste_P)", {})
      vim.api.nvim_set_keymap("n", "[y", "<plug>(YoinkRotateBack)", {})
      vim.api.nvim_set_keymap("n", "]y", "<plug>(YoinkRotateForward)", {})
      vim.api.nvim_set_keymap("n", "<c-=>", "<plug>(YoinkPostPasteToggleFormat)", {})
      vim.api.nvim_set_keymap("n", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
      vim.api.nvim_set_keymap("x", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
    end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "C:\\Users\\maxge\\Desktop\\notes",
              },
              default_workspace = "notes",
            },
          },
        },
      }
    end,
  },
  --{"karb94/neoscroll.nvim",
  --  event = "User Astrofile"},
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-l>", -- this is the default
          accept_word = false, -- this means to only accept with <C-l> on the current word instead of the whole line
          accept_line = false, -- this means to only accept with <C-l> on the whole line instead of the current word
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
}
