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
