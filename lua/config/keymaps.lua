-- Buffer
vim.keymap.set('n', '<C-L>', ':bnext<CR>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<C-H>', ':bprevious<CR>', { silent = true, desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true, desc = 'Delete Buffer' })
-- Clear search
vim.keymap.set('n', '<ESC>', vim.cmd.nohlsearch, { silent = true, desc = 'Clear Highlights' })
