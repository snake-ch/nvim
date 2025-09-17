return {
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
        python = { 'ruff' }
        -- javascript = { 'oxlint' },
        -- typescript = { 'oxlint' },
        -- javascriptreact = { 'oxlint' },
        -- typescriptreact = { 'oxlint' }
      }
    end
  }
}
