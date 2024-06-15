require('dashboard').setup {
  theme              = 'hyper',  -- theme is doom and hyper default is hyper
  disable_move       = false,    -- default is false disable move keymap for hyper
  shortcut_type      = 'letter', -- shorcut type 'letter' or 'number'
  change_to_vcs_root = false,    -- default is false,for open file in hyper mru. it will change to the root of vcs
  config             = {         -- config used for theme
    header = {},                 -- type is table def
    week_header = {
      enable = true,             --boolean use a week header
      concat = '',               --concat string after time string line
      append = {},               --table append after time string line
    },
    disable_move = false,        -- boolean default is false disable move key
    shortcut = {
      -- action can be a function type
      -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
      { desc = '󰊳 Update', group = '@character', action = 'Lazy update', key = 'u' },
      { desc = ' Files', group = '@operator', action = 'Telescope find_files', key = 'f' },
      { desc = ' Browser', group = '@constructor', action = 'Telescope file_browser', key = 'b', },
      { desc = '󰿅 Quit', group = 'Number', action = 'qa!', key = 'q' },
    },
    packages = { enable = false }, -- show how many plugins neovim loaded
    -- limit how many projects list, action when you press key or enter it will run this action.
    -- action can be a functino type, e.g.
    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
    project = { enable = true, limit = 8, icon = '󰏓 ', label = 'Recent Projects:', action = 'Telescope find_files cwd=' },
    mru = { limit = 10, icon = ' ', label = 'Most Recent Files:', cwd_only = false },
    footer = {}, -- footer
  },
  hide               = {
    statusline = true, -- hide statusline default is true
    tabline    = true, -- hide the tabline
    winbar     = true, -- hide winbar
  },
  preview            = {
    command = '',     -- preview command
    file_path = '',   -- preview file path
    file_height = '', -- preview file height
    file_width = '',  -- preview file width
  },
}
