local vim = vim
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.undofile = true
--vim.opt.verbosefile = "msg_vim.txt"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.cmdheight = 0
vim.opt.autochdir = true
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.showtabline = 2
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 999
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

--Mappings
vim.g.mapleader = " "

function compile_on_write()
	vim.api.nvim_exec(
		[[
    autocmd BufWritePost *.tex silent! !pdflatex % >/dev/null 2>&1
    autocmd BufWritePost *.tex echo "LaTeX file compiled."
  ]],
		false
	)
end

compile_on_write()
