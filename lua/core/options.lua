local opt = vim.opt

opt.number = true
opt.relativenumber = false

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

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
vim.listchars = "space:·"

opt.cursorline = true
opt.termguicolors = true

opt.updatetime = 300
opt.timeoutlen = 500

opt.cmdheight = 0