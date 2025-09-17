return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        timeout_ms = 5000,
        lsp_format = 'fallback'
      },
      formatters_by_ft = {
        go = { 'goimports', 'goimports-reviser' },
        proto = { 'buf' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
        toml = { 'taplo' },
        -- html = { 'prettierd' },
        -- css = { 'prettierd' },
        -- json = { 'prettierd' },
        -- yaml = { 'prettierd' },
        -- markdown = { 'prettierd' },
        -- javascript = { 'prettierd', stop_after_first = true },
        -- typescript = { 'prettierd', stop_after_first = true },
        -- javascriptreact = { 'prettierd', stop_after_first = true },
        -- typescriptreact = { 'prettierd', stop_after_first = true },
        ['_'] = { 'trim_whitespace' }
      }
    }
  }
}
