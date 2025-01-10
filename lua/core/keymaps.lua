local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- nvim-tree
keymap.set('n', '<F2>', ':NvimTreeToggle<CR>', opt)

-- bufferline
keymap.set('n', '<C-L>', ':bnext<CR>', opt)
keymap.set('n', '<C-H>', ':bprevious<CR>', opt)
keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', opt)
