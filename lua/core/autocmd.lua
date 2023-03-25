local autoGroup = vim.api.nvim_create_augroup('autoGroup', {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
  group = autoGroup,
  -- autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  callback = function()
    if vim.fn.expand('<afile>') == 'lua/plugins/plugins-setup.lua' then
      vim.api.nvim_command('source lua/plugins/plugins-setup.lua')
      vim.api.nvim_command('PackerSync')
    end
  end,
})

-- format on save
autocmd('BufWritePre', {
  group = myAutoGroup,
  pattern = { '*.go', '*.py' },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- nvim-tree auto close
-- autocmd('BufEnter', {
--   nested = true,
--   group = autoGroup,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
--       vim.cmd('quit')
--     end
--   end,
-- })

-- Highlight on yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = autoGroup,
  pattern = '*',
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