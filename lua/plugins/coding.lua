return {
  -- Code completion
  {
    'saghen/blink.cmp',
    dependencies = { { 'rafamadriz/friendly-snippets' } },
    version = '*',
    opts = {
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
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
          auto_show_delay_ms = 500,
          window = { max_height = 30, border = 'rounded', scrollbar = false }
        }
      },
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' }
      },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' }
  },

  -- Automatically pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  }
}
