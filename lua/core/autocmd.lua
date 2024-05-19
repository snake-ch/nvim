local autocmd = vim.api.nvim_create_autocmd
local autoGroup = vim.api.nvim_create_augroup('autoGroup', {
  clear = true,
})

-- format on save
autocmd('BufWritePre', {
  group = autoGroup,
  pattern = { '*.*' },
  callback = function(args)
    vim.lsp.buf.format({ async = false, timeout_ms = 5000, bufnr = args.buf })
  end,
})

autocmd('BufEnter', {
  group = autoGroup,
  pattern = '*',
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - 'o' -- O and o, don't continue comments
        + 'r' -- But do continue when pressing enter.
  end,
})
