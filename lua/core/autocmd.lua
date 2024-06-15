local autocmd = vim.api.nvim_create_autocmd
local autoGroup = vim.api.nvim_create_augroup('autoGroup', { clear = true })

autocmd('BufEnter', {
  group = autoGroup,
  pattern = '*',
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - 'o' -- O and o, don't continue comments
        + 'r' -- But do continue when pressing enter.
  end,
})
