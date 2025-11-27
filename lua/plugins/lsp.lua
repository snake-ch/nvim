return {
  -- Cmdline tools and lsp servers
  {
    'mason-org/mason.nvim',
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗'
        }
      }
    }
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim' },
      { 'neovim/nvim-lspconfig' }
    },
    opts = {}
  },

  -- Lspconfig
  {
    'neovim/nvim-lspconfig',
    init = function()
      -- customizing how diagnostics are displayed
      vim.diagnostic.config({
        float = { border = 'rounded' },
        underline = true,
        update_in_insert = false,
        severity_sort = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN]  = ' ',
            [vim.diagnostic.severity.INFO]  = ' ',
            [vim.diagnostic.severity.HINT]  = ' '
          },
          numhl = {},
          linehl = {}
        }
      })

      -- lsp attach event
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end

          -- format the current buffer on save
          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ async = false, bufnr = args.buf, id = client.id })
              end
            })
          end

          -- inlay hint
          if client:supports_method('textDocument/inlayHint') then
            local mode = vim.api.nvim_get_mode().mode
            vim.lsp.inlay_hint.enable(mode == 'n' or mode == 'v', { bufnr = args.buf })
          end

          -- language specified
          if client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
          end
        end
      })
    end,
    config = function()
      -- customized on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function opts(desc)
          return { noremap = true, silent = true, buffer = bufnr, desc = 'LSP ' .. desc }
        end
        vim.api.nvim_buf_set_option(bufnr, 'foldexpr', 'v:lua.vim.lsp.foldexpr()')
        vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

        -- default
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts 'Goto Declaration')
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts 'Goto Definition')
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts 'Hover')
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts 'Goto Implementation')
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts 'Signature Help')
        vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts 'Goto Type Definition')
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts 'Rename')
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts 'Code Actions')
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts 'References')
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts 'Prev Diagnostic')
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts 'Next Diagnostic')
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts 'Location List')

        -- fzf-lua
        local has_fzflua, fzf = pcall(require, 'fzf-lua')
        if has_fzflua then
          vim.keymap.set('n', 'gr', fzf.lsp_definitions, opts 'References')
          vim.keymap.set('n', 'gi', fzf.lsp_implementations, opts 'Goto Implementation')
          vim.keymap.set('n', 'gt', fzf.lsp_typedefs, opts 'Goto Definition')
          vim.keymap.set('n', '<F3>', fzf.lsp_document_symbols, opts 'Documents List')
          vim.keymap.set('n', '<leader>fd', fzf.diagnostics_workspace, opts 'Diagnostics List')
          vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions, opts 'Code Actions')
        end
      end

      -- setup lsp servers
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('blink.cmp').get_lsp_capabilities({}, false)
      )

      vim.lsp.config('gopls', {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = { gopls = { gofumpt = true } }
      })

      vim.lsp.config('pyright', {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' }
            }
          }
        }
      })

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      local servers = { 'lua_ls', 'ruff' }
      for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
          on_attach = on_attach,
          capabilities = capabilities
        })
      end

      local config_servers = {
        'lua_ls',
        'gopls',
        'pyright',
        'ruff'
      }
      for _, lsp in ipairs(config_servers) do
        vim.lsp.enable(lsp)
      end
    end
  }
}
