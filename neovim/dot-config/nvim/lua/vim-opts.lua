vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.breakindent = true
vim.opt.pumblend = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
--vim.cmd(" set tabclose='left'")
vim.opt.winblend = 10
--vim.cmd("set foldcolumn=4")
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.fdc = "auto:2"
--vim.cmd.("foldcolumn = 'auto:[1]'")

vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

vim.cmd.highlight('IndentLine guifg=#756f81')
