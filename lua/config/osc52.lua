local function is_wsl()
  if vim.env.WSL_DISTRO_NAME or vim.env.WSL_INTEROP then
    return true
  end
  if vim.fn.filereadable('/proc/version') == 1 then
    local version = table.concat(vim.fn.readfile('/proc/version'), ' '):lower()
    if version:match('microsoft') or version:match('wsl') then
      return true
    end
  end
  return false
end

if is_wsl() then
  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf'
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf'
    },
    cache_enabled = 1
  }
else
  local osc52 = require('vim.ui.clipboard.osc52')

  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = osc52.copy('+'),
      ['*'] = osc52.copy('*')
    },
    paste = {
      ['+'] = osc52.paste('+'),
      ['*'] = osc52.paste('*')
    }
  }
end
