vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }            --
vim.opt.mouse = 'a'                                                -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 2      -- number of visual spaces per TAB
vim.opt.softtabstop = 2  -- number of spacesin tab when editing
vim.opt.shiftwidth = 2   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces

-- UI config
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250'
vim.opt.termguicolors = true  -- enabl 24-bit RGB color in the TUI
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right
vim.opt.cmdheight = 0         -- cmd height

-- Edit
vim.opt.wrap = false                 -- disable line wrap
vim.opt.scrolloff = 5                -- reserve rows
vim.opt.sidescrolloff = 5            -- reserve columns
vim.opt.signcolumn = 'yes'           -- always show the signcolumn, otherwise it would shift the text each time
vim.opt.list = false                 -- show some invisible characters (tabs...
vim.opt.listchars = 'space:·,tab:>-' -- chars for space & tab
vim.opt.foldlevel = 99               -- numbers of fold
vim.opt.foldmethod = 'indent'        -- fold method

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered
