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
        -- json = { 'prettierd' },
        -- yaml = { 'prettierd' },
        -- markdown = { 'prettierd' },
        ['_'] = { 'trim_whitespace' }
      }
    }
  }
}
