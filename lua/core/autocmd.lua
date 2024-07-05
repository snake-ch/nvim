local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('snake_' .. name, { clear = true })
end

autocmd('BufEnter', {
  group = augroup('formatoptions'),
  pattern = '*',
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - 'o' -- O and o, don't continue comments
        + 'r' -- But do continue when pressing enter.
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
})

-- Copy wsl via windows clipboard
-- if vim.fn.has('wsl') then
--   autocmd({ 'TextYankPost' }, {
--     group = augroup('wsl_yank'),
--     pattern = '*',
--     callback = function()
--       vim.cmd("call system('/mnt/c/windows/system32/clip.exe ',@\")")
--     end,
--   })
-- end

-- Copy/Paste when using ssh on a remote servers
if vim.clipboard and vim.clipboard.osc52 then
  autocmd('VimEnter', {
    group = augroup('ssh_clipboard'),
    callback = function()
      if vim.env.SSH_CONNECTION and vim.clipboard.osc52 then
        vim.g.clipboard = {
          name = 'OSC 52',
          copy = {
            ['+'] = require('vim.clipboard.osc52').copy,
            ['*'] = require('vim.clipboard.osc52').copy,
          },
          paste = {
            ['+'] = require('vim.clipboard.osc52').paste,
            ['*'] = require('vim.clipboard.osc52').paste,
          },
        }
      end
    end,
  })
end
