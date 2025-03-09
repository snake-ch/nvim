return {
  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<F2>', '<cmd>NvimTreeToggle<CR>', desc = 'Explorer NVim-Tree', remap = true }
    },
    opts = {
      sort = {
        sorter = 'extension'
      },
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get()
            local window_w = screen_w * 0.5
            local window_h = screen_h * 0.8
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int
            }
          end
        },
        width = function()
          return math.floor(vim.opt.columns:get() * 0.5)
        end
      },
      filters = {
        dotfiles = true,
        custom = { '^.git$', '^node_modules$', '^target$', '*.exe' }
      },
      git = {
        enable = false
      }
    }
  },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
      },
      sections = { lualine_x = { 'encoding', 'filetype' } }
    }
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    'rcarriga/nvim-notify',
    opts = {
      fps = 30,
      stages = 'fade',
      timeout = 2000
    }
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    opts = {
      lsp = {
        progress = { enabled = false },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true
        },
        hover = { silent = true },
        documentation = { opts = { scrollbar = false } }
      },
      presets = {
        command_palette = true,      -- position the cmdline and popupmenu together
        long_message_to_split = true -- long messages will be sent to a split
      },
      views = { hover = { size = { max_width = 80 } } },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
              { find = '%d fewer lines' },
              { find = '%d more lines' }
            }
          }
        }
      }
    }
  },

  -- Flash enhances the built-in search functionality by showing labels
  -- at the end of each match, letting you quickly jump to a specific
  -- location.
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>s', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end,       desc = 'Flash' },
      { '<leader>S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' }
    }
  }
}
