return {
  -- Code completion
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()

      -- setup keybindings to tab
      local luasnip = require('luasnip')
      local function feedkey(key, mode)
        vim.fn.feedkeys(vim.keycode(key), mode or vim.api.nvim_get_mode().mode)
      end
      vim.keymap.set({ 'i', 's' }, '<Tab>', function()
        return luasnip.locally_jumpable() and luasnip.jump(1) or feedkey('<Tab>', 'n')
      end, { desc = 'Luasnip - Jump to next node' })
      vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
        return luasnip.in_snippet() and luasnip.jumpable(-1) and luasnip.jump(-1) or feedkey('<S-Tab>', 'n')
      end, { desc = 'Luasnip - Jump to previous node' })
    end
  },

  {
    'saghen/blink.cmp',
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip' },
    },
    version = '*',
    opts = {
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = function(ctx) return ctx.mode == 'cmdline' end
          }
        },
        menu = {
          max_height = 18,
          border = 'rounded',
          scrollbar = false,
          -- auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
          draw = {
            align_to = 'none',
            gap = 2,
            treesitter = { 'lsp' }
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = { max_height = 30, border = 'rounded', scrollbar = false }
        },
      },
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },
      appearance = {
        kind_icons = {
          Text = '󰉿',
          Method = '󰆧',
          Function = '󰊕',
          Constructor = '',

          Field = '󰜢',
          Variable = '󰀫',
          Property = '󰜢',

          Class = '󰠱',
          Struct = '󰙅',
          Interface = '',
          Module = '',

          Unit = '󰑭',
          Value = '󰎠',
          Enum = '',
          EnumMember = '',

          Keyword = '󰌋',
          Constant = '󰏿',

          Snippet = '',
          Color = '󰏘',
          File = '󰈙',
          Reference = '󰈇',
          Folder = '󰉋',
          Event = '',
          Operator = '󰆕',
          TypeParameter = '',
        }
      },
      snippets = { preset = 'luasnip' },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    },
    opts_extend = { 'sources.default' }
  },

  -- Automatically pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Automatically add closing tags for HTML and JSX
  {
    'windwp/nvim-ts-autotag',
    opt = {},
  },

  -- Comments
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
