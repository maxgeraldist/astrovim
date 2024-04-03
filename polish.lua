return {
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
  -- Set up custom filetypes
  vim.filetype.add {
    extension = {},
    filename = {},
    pattern = {},
  },
}
