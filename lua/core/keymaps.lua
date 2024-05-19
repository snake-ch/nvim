vim.g.mapleader = ';'

local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- nvim-tree
keymap.set('n', '<F2>', ':NvimTreeToggle<CR>', opt)

-- bufferline
keymap.set('n', '<C-L>', ':bnext<CR>', opt)
keymap.set('n', '<C-H>', ':bprevious<CR>', opt)
keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', opt)
keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opt)
keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opt)
keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opt)
keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opt)
keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opt)
keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opt)
keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opt)
keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opt)
keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opt)
keymap.set('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', opt)

-- lsp
-- vim.keymap.set('n', '<space>e', "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>")
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- keymap.set('n', '[e', "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>")
-- keymap.set('n', ']e', "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>")
-- keymap.set('n', 'gD', vim.lsp.buf.declaration, opt)
keymap.set('n', 'gd', vim.lsp.buf.definition, opt)
keymap.set('n', 'gt', vim.lsp.buf.type_definition, opt)
-- keymap.set('n', 'gi', vim.lsp.buf.implementation, opt)
-- keymap.set('n', 'gr', vim.lsp.buf.references, opt)
-- keymap.set('n', 'gh', vim.lsp.buf.hover, opt)
-- keymap.set('n', 'K', vim.lsp.buf.signature_help, opt)
-- keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opt)
-- keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opt)

-- lapsaga
-- keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opt)
-- keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opt)
-- keymap.set('n', 'gT', '<cmd>Lspsaga peek_type_definition<CR>', opt)
-- keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition<CR>', opt)
keymap.set('n', 'gh', '<cmd>Lspsaga finder<CR>', opt)
keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opt)
keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opt)
keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opt)
keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cmd>', opt)
keymap.set('n', '<F3>', '<cmd>Lspsaga outline<CR>', opt)
-- keymap.set('n', '<A-d>', "<cmd>Lspsaga term_toggle<CR>", opt)
