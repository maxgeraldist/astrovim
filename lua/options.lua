local vim = vim;
vim.opt.number = true;
vim.opt.numberwidth = 1;
vim.opt.relativenumber = true;
vim.opt.undofile = true;
--vim.opt.verbosefile = "msg_vim.txt"
vim.opt.splitbelow = true;
vim.opt.splitright = true;
vim.opt.showmode = false;
vim.opt.expandtab = true;
vim.opt.clipboard = "unnamedplus";
vim.opt.matchpairs = "(:),{:},[:],<:>";
vim.opt.cmdheight = 0;
vim.opt.autochdir = true;
vim.opt.virtualedit = "block";
vim.opt.inccommand = "split";
vim.opt.showtabline = 1;
vim.o.foldlevel = 99;
vim.o.foldlevelstart = 99;
vim.o.foldenable = true;

vim.opt.expandtab = true;
vim.opt.shiftwidth = 4;
vim.opt.tabstop = 4;
vim.opt.scrolloff = 1;
vim.opt.termguicolors = true;
vim.opt.ignorecase = true;
vim.opt.smartcase = true;

vim.g.loaded_perl_provider = 0;
vim.g.loaded_ruby_provider = 0;

--For coc
vim.opt.updatetime = 300;
vim.opt.signcolumn = "yes";

--Mappings
vim.g.mapleader = " ";

--Compile latex on write
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    callback = function()
        vim.fn.jobstart({ "pdflatex", vim.fn.expand("%") }, { detach = true });
        vim.notify("Compiling LaTeX…");
    end,
});

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Todo", timeout = 100 });
    end,
});
