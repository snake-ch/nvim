return {
  -- Code completion
  {
    'saghen/blink.cmp',
    dependencies = { { 'rafamadriz/friendly-snippets' } },
    version = '*',
    opts = {
      completion = {
        list = { selection = { preselect = false } },
        menu = {
          max_height = 12,
          border = 'rounded',
          scrollbar = false,
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
        }
      },
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        -- ['<Tab>'] = { 'select_next', 'fallback' },
        -- ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' }
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
          TypeParameter = ''
        }
      },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } }
    },
    opts_extend = { 'sources.default' }
  },

  -- Automatically pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },

  -- Automatically add closing tags for HTML and JSX
  {
    'windwp/nvim-ts-autotag',
    opts = {}
  },

  -- Comments
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {}
  }
}
