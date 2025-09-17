return {
  -- Fuzzy finder.
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files', remap = true },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Telescope live grep',  remap = true },
      { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Telescope buffers',    remap = true },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Telescope help tags',  remap = true }
    },
    opts = function()
      local actions = require('telescope.actions')
      local opts = {
        defaults = {
          -- initial_mode = 'normal',
          layout_strategy = 'vertical',
          -- sorting_strategy = 'ascending',
          file_ignore_patterns = { 'node_modules/', '.git/' }
        },
        pickers = {
          find_files = {
            find_command = { 'fdfind', '--type', 'f', '--strip-cwd-prefix' }
          },
          buffers = {
            -- ignore_current_buffer = true,
            mappings = {
              n = { ['dd'] = actions.delete_buffer + actions.move_to_top }
            }
          },
          current_buffer_fuzzy_find = {
            previewer = false
          }
        },
        extensions = {
          ['ui-select'] = require('telescope.themes').get_dropdown {}
        }
      }
      return opts
    end,
    config = function(_, opts)
      require('telescope').setup(opts)
      -- to make extensions work you need to call load_extension, somewhere after setup function.
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' }
    }
  }
}
