return {
  -- Theme
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end
  },

  -- UI
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function()
      require('plugins.telescope')
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    config = function()
      require('plugins.nvim-tree')
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.noice')
    end,
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
  },

  -- LSP
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗'
        }
      }
    },
    dependencies = { 'williamboman/mason-lspconfig.nvim' }
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp')
    end,
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  },

  -- Editing
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.cmp')
    end,
    dependencies = {
      -- source
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      -- luasnip
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- snippets
      { 'rafamadriz/friendly-snippets' },
    }
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    opt = {},
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require('plugins.null')
    end
  },
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>s', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end,       desc = 'Flash' },
      { '<leader>S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    },
  }
}
