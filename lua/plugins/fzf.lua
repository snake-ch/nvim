return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<cr>',     desc = 'FzfLuz find files', remap = true },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'FzfLuz live grep',  remap = true },
      { '<leader>fb', '<cmd>FzfLua buffers<cr>',   desc = 'FzfLuz buffers',    remap = true },
      { '<leader>fh', '<cmd>FzfLua helptags<cr>',  desc = 'FzfLuz help tags',  remap = true }
    },
    opts = {
      winopts = {
        preview = {
          scrollbar = false
        }
      },
      keymap = {
        builtin = {
          ['<c-f>'] = 'preview-page-down',
          ['<c-b>'] = 'preview-page-up'
        },
        fzf = {
          ['ctrl-u'] = 'half-page-up',
          ['ctrl-d'] = 'half-page-down',
          ['ctrl-f'] = 'preview-page-down',
          ['ctrl-b'] = 'preview-page-up'
        }
      },
      files = {
        prompt               = 'Files > ',
        cwd_prompt           = false,
        file_ignore_patterns = { 'node_modules/', '.git/' }
      }
    }
  }
}
