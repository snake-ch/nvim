return {
  -- Theme
  {
    'navarasu/onedark.nvim',
    config = function()
      require('plugins.onedark')
    end,
  },

  -- Navigating (Telescope/Tree/Buffer/Status)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function()
      require("plugins.telescope")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    config = function()
      require('plugins.nvim-tree')
    end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    config = function()
      require('plugins.bufferline')
    end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    version = "*",
    config = function()
      require('plugins.lualine')
    end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  -- LSP
  {
    'williamboman/mason.nvim',
    config = function()
      require('plugins.mason')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp')
    end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  -- LSP completion
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.cmp')
    end,
    dependencies = {
      -- source
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- snippet
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets'
    }
  },
  -- LSP addon
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('plugins.lspsaga')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },

  -- Language
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    }
  },
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('plugins.comment')
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('plugins.autopairs')
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('plugins.autotag')
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require('plugins.null')
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('plugins.hop')
    end,
  },
}
