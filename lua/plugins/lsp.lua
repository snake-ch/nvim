local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'gopls', 'pyright', 'lua_ls' }
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities
  }
end
