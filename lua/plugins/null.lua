local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        -- go
        null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.staticcheck,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.gomodifytags,

        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8.with({ extra_args = { '--ignore=E501' } }),

        -- protobuf
        null_ls.builtins.formatting.buf,
        null_ls.builtins.diagnostics.buf
    },
})