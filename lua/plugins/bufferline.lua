require('bufferline').setup {
  options = {
    numbers = 'none',     -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
    diagnostics = 'nvim_lsp',
    offsets = { {
      filetype = 'NvimTree',
      text = 'File Explorer',
      text_align = 'left',
      separator = true
    } }
  }
}
