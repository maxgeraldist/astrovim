return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- For normal mode deletion
    ["gg"] =  { "\"gg0", desc = "Go to the start of the document" },
    ["G"] =  { "\"G$", desc = "Go to the end of the document" },
    ["dd"] = { "\"_dd", desc = "Delete line without yank" },
    ["d"] = { "\"_d", desc = "Delete without yank" },
    ["D"] = { "\"_D", desc = "Delete to end of line without yank" },
    ["x"] = { "\"_x", desc = "Delete character without yank" },
    ["X"] = { "d", desc = "Cut" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- For visual mode deletion
    ["d"] = { "\"_d", desc = "Delete selection without yank" },
    ["x"] = { "d", desc = "Cut selection" },
  },
  i= {
    ["C-l"] = { "copilot#Accept(<Tab>)", silent = true, expr = true, script = true }, -- Copilot
    ["C-k"] = { "copilot#Reject(<Tab>)", silent = true, expr = true, script = true }, -- 
  },
}
