require('bufferline').setup {
  options = {
    numbers = 'none',
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true
      }
    },
    show_close_icon = false,
    show_buffer_close_icons = false,
  }
}
