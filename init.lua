function CompileTex()
  local filename = vim.fn.expand "%:r"
  local bbl_exists = vim.fn.filereadable(filename .. ".bbl")
  if bbl_exists == 0 then os.execute("pdflatex " .. filename .. ".tex > /dev/null 2>&1") end
  os.execute("biber " .. filename .. " > /dev/null 2>&1")
  os.execute("pdflatex " .. filename .. ".tex > /dev/null 2>&1")
end

return {
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
    remotes = {
      ["maxgeraldist"] = "https://github.com/maxgeraldist/astrovim",
    },
  },

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 10000,
    },
    servers = {},
  },

  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  polish = function()
    vim.api.nvim_exec("language en_US", true)
    vim.opt.clipboard = "unnamedplus"
    vim.cmd "autocmd FileType tex setlocal wrap"
    -- vim.cmd('autocmd VimEnter * if strftime("%H") >= 7 && strftime("%H") < 21 | colorscheme shine | else | colorscheme astromars | endif')
    vim.cmd "colorscheme astromars"

    vim.cmd [[
          autocmd BufWritePost *.tex silent lua CompileTex()
        ]]
    vim.g.loaded_node_provider = 0
    vim.g.loaded_perl_provider = 0
    vim.g.loaded_ruby_provider = 0
    vim.g.python3_host_prog = "/usr/bin/python3"
  end,
}
