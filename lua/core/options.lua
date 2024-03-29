local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250'
opt.mouse = 'a'
opt.clipboard:append('unnamedplus')

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.wrap = false
opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = 'yes'
-- opt.list = true
vim.listchars = 'space:·'

opt.cursorline = true
opt.termguicolors = true

opt.updatetime = 300
opt.timeoutlen = 500

opt.cmdheight = 0

vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 99
