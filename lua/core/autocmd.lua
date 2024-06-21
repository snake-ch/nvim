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

-- Copy wsl via windows clipboard
if vim.fn.has('wsl') then
  autocmd({ 'TextYankPost' }, {
    group = autoGroup,
    pattern = '*',
    callback = function()
      vim.cmd("call system('/mnt/c/windows/system32/clip.exe ',@\")")
    end,
  })
end

-- Copy/Paste when using ssh on a remote servers
if vim.clipboard and vim.clipboard.osc52 then
  autocmd('VimEnter', {
    group = autoGroup,
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
