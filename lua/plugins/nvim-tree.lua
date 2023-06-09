-- OR setup with some options
require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  actions = {
    open_file = { quit_on_open = false }
  },
  view = {
    width = 34,
  },
  renderer = {
    group_empty = true
  },
  filters = {
    dotfiles = true,
    custom = { '^.git$', '^node_modules$', '*.exe' }
  },
  git = {
    enable = false
  },
  log = {
    enable = true,
    types = {
      diagnostics = true
    }
  }
})

