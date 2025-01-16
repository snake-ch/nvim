-- Buffer
vim.keymap.set('n', '<C-L>', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<C-H>', ':bprevious<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete Buffer' })
-- Clear search
vim.keymap.set('n', '<ESC>', vim.cmd.nohlsearch, { desc = 'Clear Highlights' })
