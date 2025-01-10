local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fp', ':Telescope file_browser<CR>', {})

-- see https://github.com/nvim-telescope/telescope.nvim/issues/522
-- install ripgrep from https://github.com/BurntSushi/ripgrep
require('telescope').setup {
  defaults = {
    initial_mode = 'normal',
    layout_strategy = 'vertical',
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = 'top',
        width = 0.8
      },
      vertical = {
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = 'bottom',
        width = 0.8
      }
    },
    -- sorting_strategy = 'ascending',
    file_ignore_patterns = { 'node_modules/', '.git/' }
  },
  pickers = {
    find_files = {
      find_command = { 'fdfind', '--type', 'f', '--strip-cwd-prefix' }
    },
    buffers = {
      ignore_current_buffer = true,
      mappings = {
        n = {
          ['dd'] = actions.delete_buffer + actions.move_to_top,
        },
      }
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = 'smart_case',       -- or 'ignore_case' or 'respect_case' the default case_mode is 'smart_case'
    },
    file_browser = {
      -- theme = 'ivy',
      hijack_netrw = true, -- disables netrw and use telescope-file-browser in its place
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        -- even more opts
      }
    }
  },
}

-- to make extensions work you need to call load_extension, somewhere after setup function.
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')
