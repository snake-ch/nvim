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
        sql = { 'sqlfluff' },
        -- json = { 'prettierd' },
        -- yaml = { 'prettierd' },
        -- markdown = { 'prettierd' },
        ['_'] = { 'trim_whitespace' }
      }
    }
  },
  {
    'mfussenegger/nvim-lint',
    events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    init = function()
      vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
        group = vim.api.nvim_create_augroup('Lint', { clear = true }),
        callback = function()
          require('lint').try_lint()
        end
      })
    end,
    config = function()
      require('lint').linters_by_ft = {
        go = { 'golangcilint' },
        proto = { 'buf_lint' },
        python = { 'ruff' },
        sql = { 'sqlfluff' }
      }
    end
  }
}
