local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  -- go
  -- null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.goimports,
  null_ls.builtins.formatting.goimports_reviser,
  null_ls.builtins.diagnostics.golangci_lint,
  -- null_ls.builtins.diagnostics.staticcheck,
  null_ls.builtins.code_actions.impl,
  null_ls.builtins.code_actions.gomodifytags,

  -- python
  -- null_ls.builtins.formatting.black,
  -- null_ls.builtins.formatting.isort,
  -- null_ls.builtins.diagnostics.flake8.with({ extra_args = { '--ignore=E501' } }),

  -- protobuf
  null_ls.builtins.formatting.buf,
  null_ls.builtins.diagnostics.buf,

  -- typescript
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.rustywind,
}

null_ls.setup({
  sources = sources,

  -- you can reuse a shared lspconfig on_attach callback here
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format({
  --           async = false,
  --           timeout_ms = 5000,
  --           -- filter = function(client)
  --           --   -- apply whatever logic you want (in this example, we'll only use null-ls)
  --           --   return client.name == "null-ls"
  --           -- end,
  --           bufnr = bufnr,
  --         })
  --       end,
  --     })
  --   end
  -- end,
})
