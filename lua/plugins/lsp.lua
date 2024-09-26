local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- set the popup window border
local border = {
  { '', 'FloatBorder' },
  { '-', 'FloatBorder' },
  { '', 'FloatBorder' },
  { '|', 'FloatBorder' },
  { '', 'FloatBorder' },
  { '-', 'FloatBorder' },
  { '', 'FloatBorder' },
  { '|', 'FloatBorder' },
}
local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- customizing how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- replace the lsp info symbol
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  -- remap keybindings frequently-used to show with telescope if presented
  local builtin = require('telescope.builtin')
  if builtin then
    vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, bufopts)
    vim.keymap.set('n', '<F3>', builtin.lsp_document_symbols, bufopts)
    vim.keymap.set('n', '<leader>fe', builtin.diagnostics, bufopts)
  end

  if client.supports_method('textDocument/formatting') then
    -- format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('LspFormatting', { clear = false }),
      buffer = bufnr,
      callback = function(args)
        vim.lsp.buf.format({ async = false, bufnr = args.buf })
      end
    })

    -- Show line diagnostics automatically in hover window
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = vim.api.nvim_create_augroup('float_diagnostic', { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        })
      end,
    })
  end

  -- inlay hint
  if client.supports_method('textDocument/inlayHint', { bufnr = bufnr }) then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end


-- Example:
--
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     handlers = handlers
-- }

lspconfig['gopls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
  settings = { ['gopls'] = { gofumpt = true } }
}

lspconfig['cssls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
  settings = {
    css = { validate = false },
    less = { validate = false },
    scss = { validate = false },
  }
}

lspconfig['cssmodules_ls'].setup {
  on_attach = function(client, bufnr)
    -- avoid accepting `definitionProvider` responses from this LSP
    client.server_capabilities.definitionProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  handlers = handlers,
  init_options = {
    camelCase = true,
  },
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  'lua_ls',
  'html',
  'emmet_language_server',
  'tailwindcss',
  'ts_ls',
  'eslint',
}
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers
  }
end
