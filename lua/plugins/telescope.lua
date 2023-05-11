local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- see https://github.com/nvim-telescope/telescope.nvim/issues/522
-- install ripgrep from https://github.com/BurntSushi/ripgrep
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {}
  }
}

