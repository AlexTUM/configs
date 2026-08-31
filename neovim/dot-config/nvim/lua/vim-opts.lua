vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.breakindent = true
vim.opt.pumblend = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
--vim.cmd(" set tabclose='left'")
vim.opt.winblend = 10
--vim.cmd("set foldcolumn=4")
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
vim.opt.fdc = "auto:2"
--vim.cmd.("foldcolumn = 'auto:[1]'")

vim.keymap.set({'n', 'x'}, 'gy', '"+y', { desc = "Yank to system clipboard"})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', { desc = "Paste from system clipboard"})

